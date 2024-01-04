'use strict';

const stringify = require('json-stringify-deterministic');
const sortKeysRecursive = require('sort-keys-recursive');
const { Contract } = require('fabric-contract-api');

class SmartContract1 extends Contract {

    async InitLedger(ctx) {
        console.info('============= START : Initialize Ledger ===========');

        const smartcontract1 = [
            {
                prj_id: 'prj_id',
                prj_company: 'prj_company',
                prj_company_details: 'prj_company_details',
                prj_description: 'prj_description',
                prj_sba_id: 'prj_sba_id',
                prj_sba_address: 'prj_sba_address',
                prj_sba_landmark: 'prj_sba_landmark',
                prj_sba_lat: 0.0,
                prj_sba_long: 0.0,
                prj_sba_details: 'prj_sba_details',
                prj_sba_media_list: [],
                prj_status: 0,
                asset_services_list: [],
                prj_nft_id: 'ERC3525NFTID',
                prj_valuation: 0,
                prj_lastupdate_user: 'user-id'
            },
        ];

        for (const sc1 of smartcontract1) {
            await ctx.stub.putState(sc1.prj_id, Buffer.from(stringify(sortKeysRecursive(sc1))));
            console.log(`Asset ${sc1.prj_id} initialized`);
        }

        console.info('============= END : Initialize Ledger ===========');
    }

    async CreateProject(ctx, prj_id, prj_company, prj_company_details, prj_description, prj_sba_id, prj_sba_address, prj_sba_landmark, prj_sba_lat, prj_sba_long, prj_sba_details, prj_sba_media_list, prj_status, asset_services_list, prj_nft_id, prj_valuation, prj_lastupdate_user) {
        const exists = await this.ProjectExists(ctx, prj_id);
        if (exists) {
            throw new Error(`The project ${prj_id} already exists`);
        }

        const project = {
            prj_id: prj_id,
            prj_company: prj_company,
            prj_company_details: prj_company_details,
            prj_description: prj_description,
            prj_sba_id: prj_sba_id,
            prj_sba_address: prj_sba_address,
            prj_sba_landmark: prj_sba_landmark,
            prj_sba_lat: prj_sba_lat,
            prj_sba_long: prj_sba_long,
            prj_sba_details: prj_sba_details,
            prj_sba_media_list: prj_sba_media_list,
            prj_status: prj_status,
            asset_services_list: asset_services_list,
            prj_nft_id: prj_nft_id,
            prj_valuation: prj_valuation,
            prj_lastupdate_user: prj_lastupdate_user
        };

        await ctx.stub.putState(prj_id, Buffer.from(stringify(sortKeysRecursive(project))));
        return JSON.stringify(project);
    }

    // GetProject returns the project stored in the world state with the given prj_id.
    async GetProject(ctx, prj_id) {
        const projectJSON = await ctx.stub.getState(prj_id);
        if (!projectJSON || projectJSON.length === 0) {
            throw new Error(`The project ${prj_id} does not exist`);
        }
        return projectJSON.toString('utf-8');
    }


    // ListAllProjects returns a list of all projects stored in the world state.
    async ListAllProjects(ctx) {
        const allResults = [];
        const iterator = await ctx.stub.getStateByRange('', '');

        for await (const result of iterator) {
            const strValue = Buffer.from(result.value.toString()).toString('utf-8');
            let project;
            try {
                project = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                project = strValue;
            }
            allResults.push(project);
        }

        return JSON.stringify(allResults);
    }

    /* updatedFields-
    *************************************************************************
        const updatedFields = {
        prj_company: 'New Company Name',
        prj_description: 'Updated Project Description',
        prj_status: 1,
        // Add more fields as needed
        };

        await contract.UpdateProject(ctx, 'PRJ0001', updatedFields);
    *************************************************************************    
    */

    async UpdateProject(ctx, prj_id, updatedFields) {
        const exists = await this.ProjectExists(ctx, prj_id);
        if (!exists) {
            throw new Error(`The project ${prj_id} does not exist`);
        }

        // Fetch the existing project
        const existingProjectJSON = await ctx.stub.getState(prj_id);
        const existingProject = JSON.parse(existingProjectJSON.toString('utf-8'));

        // Update only the specified fields
        Object.assign(existingProject, updatedFields);

        // Insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
        return ctx.stub.putState(prj_id, Buffer.from(stringify(sortKeysRecursive(existingProject))));
    }

    //If we need to update all field values through prj_id
    // async UpdateProject(ctx, prj_id, prj_company, prj_company_details, prj_description, prj_sba_id, prj_sba_address, prj_sba_landmark, prj_sba_lat, prj_sba_long, prj_sba_details, prj_sba_media_list, prj_status, asset_services_list, prj_nft_id, prj_valuation, prj_lastupdate_user) {
    //     const exists = await this.ProjectExists(ctx, prj_id);
    //     if (!exists) {
    //         throw new Error(`The project ${prj_id} does not exist`);
    //     }
    
    //     // Overwriting the original project with the updated project
    //     const updatedProject = {
    //         prj_id: prj_id,
    //         prj_company: prj_company,
    //         prj_company_details: prj_company_details,
    //         prj_description: prj_description,
    //         prj_sba_id: prj_sba_id,
    //         prj_sba_address: prj_sba_address,
    //         prj_sba_landmark: prj_sba_landmark,
    //         prj_sba_lat: prj_sba_lat,
    //         prj_sba_long: prj_sba_long,
    //         prj_sba_details: prj_sba_details,
    //         prj_sba_media_list: prj_sba_media_list,
    //         prj_status: prj_status,
    //         asset_services_list: asset_services_list,
    //         prj_nft_id: prj_nft_id,
    //         prj_valuation: prj_valuation,
    //         prj_lastupdate_user: prj_lastupdate_user
    //     };
    
    //     // Insert data in alphabetic order using 'json-stringify-deterministic' and 'sort-keys-recursive'
    //     return ctx.stub.putState(prj_id, Buffer.from(stringify(sortKeysRecursive(updatedProject))));
    // }


}


module.exports = SmartContract1;

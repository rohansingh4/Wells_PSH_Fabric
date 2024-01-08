"use strict";

const { Contract } = require("fabric-contract-api");

class Agreement extends Contract {
  async CreateContract(ctx, agreementData) {
    try {
      let agreement = JSON.parse(agreementData);

      // Validate the received data against the schema
      const allowedFields = [
        "prj_id",
        "prj_company",
        "prj_company_details",
        "prj_description",
        "prj_sba_id",
        "prj_sba_address",
        "prj_sba_landmark",
        "prj_sba_lat",
        "prj_sba_long",
        "prj_sba_details",
        "prj_sba_media_list",
        "prj_status",
        "asset_services_list",
        "prj_nft_id",
        "prj_valuation",
        "prj_last_update_dttime",
        "prj_lastupdate_user",
      ];

      const receivedFields = Object.keys(agreement);
      const missingFields = allowedFields.filter(
        (field) => !receivedFields.includes(field)
      );
      const extraFields = receivedFields.filter(
        (field) => !allowedFields.includes(field)
      );

      if (missingFields.length > 0) {
        throw new Error(`Missing required fields: ${missingFields.join(", ")}`);
      }

      if (extraFields.length > 0) {
        throw new Error(`Unexpected fields: ${extraFields.join(", ")}`);
      }

      // Store the data in the ledger
      await ctx.stub.putState(agreement.prj_id, JSON.stringify(agreement));

      return ctx.stub.getTxID();
    } catch (err) {
      throw new Error(err.stack);
    }
  }

  async updateAsset(ctx, prj_id, updateValue) {
    try {
      const exists = await this.assetExists(ctx, prj_id);
      if (!exists) {
        throw new Error(`The project with ID ${prj_id} does not exist`);
      }

      // Parse the update value and update the specified fields
      const updateData = JSON.parse(updateValue);

      // Validate the received data against the schema
      const allowedFields = [
        "prj_company",
        "prj_company_details",
        "prj_description",
        "prj_sba_id",
        "prj_sba_address",
        "prj_sba_landmark",
        "prj_sba_lat",
        "prj_sba_long",
        "prj_sba_details",
        "prj_sba_media_list",
        "prj_status",
        "asset_services_list",
        "prj_nft_id",
        "prj_valuation",
        "prj_last_update_dttime",
        "prj_lastupdate_user",
      ];

      const receivedFields = Object.keys(updateData);
      const invalidFields = receivedFields.filter(
        (field) => !allowedFields.includes(field)
      );

      if (invalidFields.length > 0) {
        throw new Error(`Invalid fields: ${invalidFields.join(", ")}`);
      }

      // Fetch existing data from the ledger
      const existingData = await ctx.stub.getState(prj_id);

      // Merge the existing data with the update data
      const updatedAsset = {
        ...JSON.parse(existingData.toString()),
        ...updateData,
      };

      // Update the ledger with the merged data
      await ctx.stub.putState(prj_id, Buffer.from(JSON.stringify(updatedAsset)));

      return ctx.stub.getTxID();
    } catch (err) {
      throw new Error(err.stack);
    }
  }

  async getAllAssets(ctx) {
    try {
      const allResults = [];
      const iterator = await ctx.stub.getStateByRange("", "");
      let result = await iterator.next();

      while (!result.done) {
        const strValue = Buffer.from(result.value.value.toString()).toString(
          "utf8"
        );

        let record;
        try {
          record = JSON.parse(strValue);
        } catch (err) {
          console.log(err);
          record = strValue;
        }

        allResults.push({ Key: result.value.key, Record: record });
        result = await iterator.next();
      }

      return JSON.stringify(allResults);
    } catch (err) {
      throw new Error(err.message);
    }
  }

  async getAssetByID(ctx, prj_id) {
    try {
      const assetJSON = await ctx.stub.getState(prj_id);

      if (!assetJSON || assetJSON.length === 0) {
        throw new Error(`The project with ID ${prj_id} does not exist`);
      }

      return assetJSON.toString();
    } catch (err) {
      throw new Error(err.stack);
    }
  }

  async assetExists(ctx, prj_id) {
    const assetJSON = await ctx.stub.getState(prj_id);
    return assetJSON && assetJSON.length > 0;
  }
}

module.exports = Agreement;

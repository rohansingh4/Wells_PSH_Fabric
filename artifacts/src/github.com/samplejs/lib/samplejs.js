'use strict';

const { Contract } = require('fabric-contract-api');

class SampleJS extends Contract {

    constructor() {
        super('SampleJS');
    }

    async Init(ctx) {
        // Initialization logic can be added here if needed
    }

    async Create(ctx, index, name, status) {
        const data = {
            index: index,
            name: name,
            status: status,
        };

        await ctx.stub.putState(`DATA${index}`, Buffer.from(JSON.stringify(data)));
    }

    async QueryAll(ctx) {
        const iterator = await ctx.stub.getStateByRange('', '');
        const dataEntries = [];

        while (true) {
            const result = await iterator.next();
            if (result.value && result.value.value.toString()) {
                const data = JSON.parse(result.value.value.toString('utf8'));
                dataEntries.push(data);
            }

            if (result.done) {
                await iterator.close();
                return dataEntries;
            }
        }
    }

    async QueryByID(ctx, index) {
        const dataJSON = await ctx.stub.getState(`DATA${index}`);
        if (!dataJSON || dataJSON.length === 0) {
            throw new Error(`Data with index ${index} does not exist`);
        }

        const data = JSON.parse(dataJSON.toString('utf8'));
        return data;
    }

    async Update(ctx, index, additionalName, additionalStatus) {
        const data = await this.QueryByID(ctx, index);

        // Add more details
        data.name += additionalName;
        data.status = additionalStatus;

        await ctx.stub.putState(`DATA${index}`, Buffer.from(JSON.stringify(data)));
    }

    async DeleteByID(ctx, index) {
        await ctx.stub.deleteState(`DATA${index}`);
    }
}

module.exports = SampleJS;

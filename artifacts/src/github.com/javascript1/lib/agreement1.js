"use strict";

const { Contract } = require("fabric-contract-api");

class Agreement extends Contract {
  async CreateContract(ctx, agreementData) {
    try {
      let agreement = JSON.parse(agreementData);

      // Validate that prj_id, prj_data, and prj_url are present in agreementData
      if (!agreement.prj_id || !agreement.prj_data || !agreement.prj_url) {
        throw new Error("Invalid agreement data. Missing prj_id, prj_data, or prj_url.");
      }

      // Validate that prj_url is an array
      if (!Array.isArray(agreement.prj_url)) {
        throw new Error("Invalid agreement data. prj_url must be an array.");
      }

      // You can add additional validation logic as needed

      // Save data to the ledger with distinct schemas
      await ctx.stub.putState(`prj_id_${agreement.prj_id}`, JSON.stringify({ prj_id: agreement.prj_id, type: "prj_id", data: agreement.prj_id }));
      await ctx.stub.putState(`prj_data_${agreement.prj_id}`, JSON.stringify({ prj_id: agreement.prj_id, type: "prj_data", data: agreement.prj_data }));
      await ctx.stub.putState(`prj_url_${agreement.prj_id}`, JSON.stringify({ prj_id: agreement.prj_id, type: "prj_url", data: agreement.prj_url }));

      return ctx.stub.getTxID();
    } catch (err) {
      throw new Error(err.stack);
    }
  }

  async getAssetByID(ctx, id, type) {
    try {
      // Use the provided type to construct the key for retrieval
      const key = `${type}_${id}`;
      const assetJSON = await ctx.stub.getState(key);

      if (!assetJSON || assetJSON.length === 0) {
        throw new Error(`The asset ${id} with type ${type} does not exist`);
      }

      return assetJSON.toString();
    } catch (err) {
      throw new Error(err.stack);
    }
  }

  async getAllAssets(ctx, type) {
    try {
      const allResults = [];
      const iterator = await ctx.stub.getStateByRange("", "");

      let result = await iterator.next();
      while (!result.done) {
        const strValue = Buffer.from(result.value.value.toString()).toString("utf8");

        let record;
        try {
          record = JSON.parse(strValue);
        } catch (err) {
          console.log(err);
          record = strValue;
        }

        // Check if the retrieved record matches the specified type
        if (record.type === type || !type) {
          allResults.push({ Key: result.value.key, Record: record });
        }

        result = await iterator.next();
      }

      return JSON.stringify(allResults);
    } catch (err) {
      return new Error(err.message);
    }
  }
}

module.exports = Agreement;

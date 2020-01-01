/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for collections of ledger states --  a state list
const StateList = require('./../ledger-api/statelist.js');

const CommercialPaper = require('./paper.js');

class PaperList extends StateList {

    constructor(ctx) {
        console.log("[DEBUG] in PaperList.constructor(ctx)");
        super(ctx, 'org.papernet.commercialpaperlist');
        this.use(CommercialPaper);
    }

    async addPaper(paper) {
        console.log("[DEBUG] in PaperList.addPaper(paper)");
        return this.addState(paper);
    }

    async getPaper(paperKey) {
        console.log("[DEBUG] in PaperList.getPaper(paperKey)");
        return this.getState(paperKey);
    }

    async updatePaper(paper) {
        console.log("[DEBUG] in PaperList.updatePaper(paper)");
        return this.updateState(paper);
    }
}


module.exports = PaperList;
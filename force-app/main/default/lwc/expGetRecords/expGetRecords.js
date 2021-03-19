import { api, LightningElement, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import RATING_FIELD from "@salesforce/schema/Account.Rating";

const FIELDS = [NAME_FIELD, INDUSTRY_FIELD, RATING_FIELD];

export default class ExpGetRecords extends LightningElement {
  @api
  recordId;

  //   name;
  //   rating;
  //   industry;

  @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
  account;

  get name() {
    return getFieldValue(this.account.data, NAME_FIELD);
  }

  get industry() {
    return getFieldValue(this.account.data, INDUSTRY_FIELD);
  }

  get rating() {
    return getFieldValue(this.account.data, RATING_FIELD);
  }

  // @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
  // accountRecord({ error, data }) {
  //   if (data) {
  //     this.name = data.fields.Name.value;
  //     this.rating = data.fields.Rating.value;
  //     this.industry = data.fields.Industry.value;
  //   } else if (error) {
  //     console.log(error);
  //   }
  // }
}

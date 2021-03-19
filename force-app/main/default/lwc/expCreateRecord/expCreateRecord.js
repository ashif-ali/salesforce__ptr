import { LightningElement } from "lwc";
import { createRecord } from "lightning/uiRecordApi";

import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";
import ACCOUNT_INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";

export default class ExpCreateRecord extends LightningElement {
  nameProp;
  industryProp;

  handleChange(event) {
    if (event.target.name === "name") {
      this.nameProp = event.target.value;
    } else {
      this.industryProp = event.target.value;
    }
  }

  handleClick() {
    const fields = {};

    fields[ACCOUNT_NAME_FIELD.fieldApiName] = this.nameProp;
    fields[ACCOUNT_INDUSTRY_FIELD.fieldApiName] = this.industryProp;

    const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };

    createRecord(recordInput)
      .then((record) => {
        console.log(record);
      })
      .catch((error) => {
        console.log(error);
      });
  }
}

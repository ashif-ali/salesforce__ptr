import { api, LightningElement } from "lwc";
import { createRecord } from "lightning/uiRecordApi";

import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import OPPORTUNITY_NAME from "@salesforce/schema/Opportunity.Name";
import OPPORTUNITY_CLOSE_DATE from "@salesforce/schema/Opportunity.CloseDate";
import OPPORTUNITY_STAGE from "@salesforce/schema/Opportunity.StageName";

export default class CreateRecordOpp extends LightningElement {
  handleChange(event) {
    if (event.target.name === "oppName") {
      this.nameProp = event.target.value;
    } else {
      this.closedDateProp = event.target.value;
    }
  }

  handleClick() {
    const fields = {};
    console.log(this.nameProp);
    console.log(typeof this.closedDateProp);
    fields[OPPORTUNITY_NAME.fieldApiName] = this.nameProp;
    fields[OPPORTUNITY_STAGE.fieldApiName] = "Prospecting";
    fields[OPPORTUNITY_CLOSE_DATE.fieldApiName] = this.closedDateProp;

    const recordInput = { apiName: OPPORTUNITY_OBJECT.objectApiName, fields };

    createRecord(recordInput)
      .then((record) => {
        console.log(record);
      })
      .catch((error) => {
        console.log(error);
      });
  }
}

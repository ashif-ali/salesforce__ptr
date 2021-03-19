import { LightningElement, wire } from "lwc";

import getAccounts from "@salesforce/apex/CustomAccountController.getAccounts";

export default class ExpCustomAccountsComponent extends LightningElement {
  //wiring a method to prop
  @wire(getAccounts)
  accounts;

  //wiring a method to function
  @wire(getAccounts)
  accountsList({ data, error }) {
    if (data) {
      //console.log(data);
      for (let key in data) {
        if (key) {
          console.log(key);
        }
      }
    } else {
      console.log(error);
    }
  }
}

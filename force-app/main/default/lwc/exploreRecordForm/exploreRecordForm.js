import { api, LightningElement } from "lwc";
import ACCOUNT_NAME from "@salesforce/schema/Account.Name";
import ACCOUNT_WEBSITE from "@salesforce/schema/Account.Website";
import ACCOUNT_BILL_CITY from "@salesforce/schema/Account.BillingCity";

export default class ExploreRecordForm extends LightningElement {
  @api
  recordId;

  fields = [ACCOUNT_NAME, ACCOUNT_WEBSITE, ACCOUNT_BILL_CITY];
}

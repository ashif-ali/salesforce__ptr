import { api, LightningElement } from "lwc";

export default class ChildComponent extends LightningElement {
  @api
  message = "This is default value";

  totalSum;

  @api
  handleClick() {
    console.log("This is from handle click");
  }

  @api
  sum(a, b) {
    this.totalSum = +a + +b;
  }
}

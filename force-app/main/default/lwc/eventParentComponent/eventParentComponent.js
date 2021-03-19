import { LightningElement } from "lwc";

export default class EventParentComponent extends LightningElement {
  handleParentOnAli(event) {
    console.log(event.detail.name);
    console.log(event.detail.age);
    console.log(event.detail.location);
    console.log("hey I am from parent");
  }
}

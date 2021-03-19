import { LightningElement } from "lwc";

export default class EventChildComponent extends LightningElement {
  handleClick() {
    this.template.querySelector("p").dispatchEvent(new CustomEvent("ali"));
  }

  handleOnAli() {
    console.log("HEY!!!!!");
  }
}

import { LightningElement } from "lwc";

export default class ParentComponent extends LightningElement {
  valOne;
  valTwo;

  handleChange(event) {
    if (event.target.name === "valOne") {
      this.valOne = event.target.value;
    } else if (event.target.name === "valTwo") {
      this.valTwo = event.target.value;
    }
  }

  handleMethodInvocation() {
    this.template.querySelector("c-child-component").handleClick();

    this.template
      .querySelector("c-child-component")
      .sum(this.valOne, this.valTwo);
    this.valOne = "";
    this.valTwo = "";
  }
}

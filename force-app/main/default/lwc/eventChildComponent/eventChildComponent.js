import { LightningElement } from "lwc";

export default class EventChildComponent extends LightningElement {
  handleClick() {
    const person = {
      name: "Ashif",
      age: 23,
      location: "WB"
    };

    this.template
      .querySelector("p")
      .dispatchEvent(
        new CustomEvent("ali", {
          bubbles: true,
          composed: true,
          detail: person
        })
      );
  }

  handleOnAli() {
    console.log("HEY!!!!!");
  }
}

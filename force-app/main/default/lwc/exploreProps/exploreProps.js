import { LightningElement } from "lwc";

export default class ExploreProps extends LightningElement {
  message;

  handleClick() {
    this.message = "Hello" + Date.now();
  }

  renderedCallback() {
    console.log(`I am getting updated everytime ${Date.now()}`);
  }
}

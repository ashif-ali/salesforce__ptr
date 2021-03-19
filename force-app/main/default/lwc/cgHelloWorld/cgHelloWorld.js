import { LightningElement } from "lwc";

export default class CgHelloWorld extends LightningElement {
  firstName = "Ashif";
  location = "Farakka";
  message = "India"; // same as props in react

  handleChange(event) {
    if (event.target.name === "firstName") {
      this.firstName = event.target.value;
      console.log(this.firstName);
    } else if (event.target.name === "message") {
      this.message = event.target.value;
      console.log(this.message);
    } else if (event.target.name === "location") {
      this.location = event.target.value;
      console.log(this.location);
    }
  }

  handleClick() {
    console.log("Hello");
  }

  //   constructor() {
  //     super();
  //     console.log("I am in constructor");
  //   }

  //   connectedCallback() {
  //     //componentDidMount()
  //     console.log("I am in connectedCallback");
  //   } //when a dom is connected to main dom this get called

  // renderedCallback(){
  //     console.log('I am in renderedCallback');
  // } // when html is properly connected this gets called

  //   disconnectedCallback() {
  //     console.log("I am in disconnectedCallback"); //when you want to destroy a particular component. E.g when you click X in any modal.
  //   }

  //   errorCallback() {
  //     console.log("I am in errorCallback");
  //   } // if any error comes in any of the lifecyle methods
}

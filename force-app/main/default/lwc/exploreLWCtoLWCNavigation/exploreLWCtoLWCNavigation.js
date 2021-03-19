import { LightningElement } from "lwc";
import { NavigationMixin } from "lightning/navigation";

export default class ExploreLWCtoLWCNavigation extends NavigationMixin(
  LightningElement
) {
  handleClick() {
    let conf = {
      type: "standard__component",
      attributes: {
        componentName: "c__HouseLWCComponent"
      },
      state: {
        c__name: "Ashif",
        c__age: 23,
        c__location: "India",
        c__profession: "Intern"
      }
    };
    this[NavigationMixin.Navigate](conf);
  }
}

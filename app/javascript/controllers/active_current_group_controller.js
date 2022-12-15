import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active-current-group"
export default class extends Controller {
  static targets = ["group"]

  connect() {
    // console.log("Hello");
    // console.log(this.groupTargets);
  }

  inlight(event) {
    // event.preventDefault()
    // console.log(event);

    this.groupTargets.forEach((groupTarget) => {
      groupTarget.classList.remove("border");
    });
    event.currentTarget.classList.add('border');
  }

}

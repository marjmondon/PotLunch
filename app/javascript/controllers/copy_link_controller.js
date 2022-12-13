import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-link"
export default class extends Controller {
  static targets = ["link"]

  connect() {
    // console.log("Hello");
    // console.log(this.linkTarget.value);
  }

  copy(event) {
    // console.log(event);

        // Get the text field
    const copyText = this.linkTarget.value;
    navigator.clipboard.writeText(copyText);

  }
}

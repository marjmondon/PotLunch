import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-link"
export default class extends Controller {
  static targets = ["link", "popup"]

  connect() {
    // console.log("Hello");
    // console.log(this.linkTarget.value);
  }

  copy(event) {
    // console.log(event);

    const copyText = this.linkTarget.value;
        // Get the text field
    navigator.clipboard.writeText(copyText);

    this.popupTarget.classList.remove("d-none");
    setTimeout(() => {
      this.#dismiss();
    }, 1000);
  }

  #dismiss() {
    this.popupTarget.classList.add("d-none");
  }
  }

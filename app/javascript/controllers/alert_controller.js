import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {

  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 4000);
  }

  dismiss() {
    this.element.remove();
  }
}

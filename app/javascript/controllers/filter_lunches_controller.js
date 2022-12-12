import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-lunches"
export default class extends Controller {
  static targets = ["lunch", "tags"]

  connect() {

  }

  showveganlunches(event) {
    event.preventDefault()
    // console.log("TODO: send request in AJAX")
    this.lunchTargets.forEach((lunchTarget) => {

      const tags = JSON.parse(lunchTarget.dataset.lunchTags)

      if (tags.includes("Vegan")) {
        lunchTarget.classList.remove("d-none");
      } else {
        lunchTarget.classList.add("d-none");
      }
    });
  }
}

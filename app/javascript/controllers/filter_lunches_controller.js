import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-lunches"
export default class extends Controller {
  static targets = ["lunch", "tags", "alllunches"]
  static values = { tag: String }

  connect() {
    // console.log(this.alllunchesTarget);
  }

  showfilterlunches(event) {
    event.preventDefault()
    // console.log(event.params.tag)
    this.lunchTargets.forEach((lunchTarget) => {

      const tags = JSON.parse(lunchTarget.dataset.lunchTags)

      if (tags.includes(event.params.tag)) {
        lunchTarget.classList.remove("d-none");
      } else {
        lunchTarget.classList.add("d-none");
      }
    });
    this.alllunchesTarget.scrollIntoView()
  }

  showalllunches(event) {
    event.preventDefault()

    // this.lunchTargets.classList.remove("d-none");
    this.lunchTargets.forEach((lunchTarget) => {
      lunchTarget.classList.remove("d-none");
    });

    this.alllunchesTarget.scrollIntoView()
  }
}

import { Controller } from "@hotwired/stimulus";
import { Tooltip } from "bootstrap/dist/js/bootstrap.bundle.js";

export default class extends Controller {
  connect() {
    new Tooltip(this.element)
  }
}

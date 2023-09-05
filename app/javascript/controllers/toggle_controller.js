import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["filtres", "img"]
  connect() {
    console.log(this.filtresTarget)
  }

  boom() {
    this.filtresTarget.classList.toggle("d-none");
    this.imgTarget.classList.toggle("d-none");
  }
}

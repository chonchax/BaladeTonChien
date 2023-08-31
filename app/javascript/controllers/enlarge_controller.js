import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enlarge"
export default class extends Controller {
  static targets = ["img"]

  connect() {
    console.log(this.element);
  }

  fire() {
    // this.imgTarget.classList.Add("big");
    console.log(this.imgTarget.classList);
    this.imgTarget.classList.add("big")
  }
}

import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed"
export default class extends Controller {
  static values = {
    sentences: Array
  }

  connect() {
    const options = {strings: this.sentencesValue, typeSpeed: 30, backDelay: 700}
    new Typed(this.element, options)
  }
}

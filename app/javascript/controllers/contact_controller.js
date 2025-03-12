import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact"
export default class extends Controller {
  static targets = ["accordeon"]
  connect() {
  }
  toggleAccordeon(){
    this.accordeonTarget.classList.toggle("open")
  }
}

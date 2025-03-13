import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact"
export default class extends Controller {
  static targets = ["accordeon","headerAccordeon"]
  connect() {
  }
  toggleAccordeon(event){
    this.accordeonTargets[this.headerAccordeonTargets.indexOf(event.currentTarget)].classList.toggle("open")
  }
}

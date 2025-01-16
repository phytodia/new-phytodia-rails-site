import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["left","right","carousel","card"]
  connect() {
  }
  clickRight(){
    let carousel = document.querySelector(".carousel");
    carousel.scrollLeft += document.querySelector(".card_carousel").clientWidth
  }
  clickLeft(){
    let carousel = document.querySelector(".carousel");
    carousel.scrollLeft -= document.querySelector(".card_carousel").clientWidth
  }
}

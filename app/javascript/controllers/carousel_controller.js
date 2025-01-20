import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["left","right","carousel","card","point"]
  connect() {
  }
  clickRight(){
    let carousel = document.querySelector(".carousel");
    carousel.scrollLeft += document.querySelector(".card_carousel").clientWidth

    let indexPoint = this.pointTargets.indexOf(document.querySelector(".carousel_point.active"))
    this.pointTargets[indexPoint].classList.remove("active")
    this.pointTargets[indexPoint+1].classList.add("active")
    //ajouter condition if 0 et max de l'array
  }
  clickLeft(){
    let carousel = document.querySelector(".carousel");
    carousel.scrollLeft -= document.querySelector(".card_carousel").clientWidth

    let indexPoint = this.pointTargets.indexOf(document.querySelector(".carousel_point.active"))
    this.pointTargets[indexPoint].classList.remove("active")
    this.pointTargets[indexPoint-1].classList.add("active")
    //ajouter condition if 0 et max de l'array
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact"
export default class extends Controller {
  static targets = ["accordeon","headerAccordeon","formObject","stageSelect"]
  connect() {
  }
  toggleAccordeon(event){
    this.accordeonTargets[this.headerAccordeonTargets.indexOf(event.currentTarget)].classList.toggle("open")
  }
  selectObject(event){
    //Cosmétique,Analyse,Extraction,Ingrédients,Informations,Stage/emploi,Autre
    let optionsArray = Array.from(this.formObjectTarget.options)
    optionsArray = optionsArray.filter(item => item.value != '')
    optionsArray = optionsArray.map((item) => item.value)
    let indexValue = optionsArray.indexOf(this.formObjectTarget.value)

    if (indexValue === 0){
      // si cosmétique est sélectionné
      this.displayCosmetique()
    }
    else if(indexValue === 5){
      //si stage/emploi est sélectionné
      this.displayStage()

    }
    else {
      document.querySelector(".contact_emploi").classList.remove("visible")
      document.querySelector(".contact_duree_stage").classList.remove("visible")
      document.querySelector(".contact_a_partir_de").classList.remove("visible")
    }
    //if(event.currentTarget.value === "Cosmétique")
  }
  displayCosmetique(){
    //let classElement = document.querySelector(classAfterInsert)
    debugger;
  }
  displayStage(){
    //let classElement = document.querySelector(classAfterInsert)
    document.querySelector(".contact_emploi").classList.add("visible")
    ``
  }
  selectStage(event){
    //"CDD/CDI","Stage","Alternance"
    let optionsArray = Array.from(this.stageSelectTarget.options)
    optionsArray = optionsArray.filter(item => item.value != '')
    optionsArray = optionsArray.map((item) => item.value)
    let indexValue = optionsArray.indexOf(this.stageSelectTarget.value)
    if(indexValue === 1) {
      document.querySelector(".contact_duree_stage").classList.add("visible")
      document.querySelector(".contact_a_partir_de").classList.add("visible")
    }
    else {
      document.querySelector(".contact_duree_stage").classList.remove("visible")
      document.querySelector(".contact_a_partir_de").classList.remove("visible")
    }
  }
}
//contact_emploi
//contact_duree_stage
//contact_a_partir_de

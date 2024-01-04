import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="exercise-instance"
export default class extends Controller {
  static targets = [ "select", "strengthFormInputs", "cardioFormInputs" ]
  static values = {
    category: String
  }

  connect() {
    console.log(this.categoryValue)
  }

  hideOrShowElement() {
    // console.log(this.optionTarget)
    if (this.selectTarget.value == 1) {
      this.showStrengthForm();
    }

    if (this.selectTarget.value == 2) {
      this.showCardioForm();
    }
  }
  
  showStrengthForm() {
    this.strengthFormInputsTarget.hidden = false;
    this.cardioFormInputsTarget.hidden = true;
  }

  showCardioForm() {
    this.strengthFormInputsTarget.hidden = true;
    this.cardioFormInputsTarget.hidden = false;
  }

  disconnect() {
    // todo clear the inputs that are hidden
  }

}

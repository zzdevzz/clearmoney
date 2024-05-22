import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="actions"
export default class extends Controller {
  static targets = ['button'];

  highlightButton(event) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove('active');
    });

    event.currentTarget.classList.add('active');
  }

}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "display"]
  connect() {
    // Get initial time from data attribute (optional)
    this.targetTime = parseInt(this.element.dataset.targetTime) || 0; // Default to 0 seconds
    this.startTime = Date.now();
    this.updateTimer();
    this._intervalId = setInterval(this.updateTimer.bind(this), 1000); // Update every second
  }

  disconnect() {
    clearInterval(this._intervalId); // Stop timer on disconnect
  }

  updateTimer() {
    const elapsedTime = Math.floor((Date.now() - this.startTime) / 1000);
    const remainingTime = Math.max(0, this.targetTime - elapsedTime);

    // Update display element with formatted time (minutes:seconds)
    this.displayTarget.textContent = `${Math.floor(remainingTime / 60)}:${remainingTime % 60}`;
  }

  incrementTimerBy20() {
    this.targetTime = Math.max(0, this.targetTime + 20);
    this.updateTimer();
  }
  
  decrementTimerBy20() {
    this.targetTime = Math.max(0, this.targetTime - 20);
    this.updateTimer();
  }
}
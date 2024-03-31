import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "display"]
  connect() {
    this.initTimer();
  }
  
  initTimer() {
    this.targetTime = parseInt(this.element.dataset.targetTime);
    this.startTime = Date.now();
    this.updateTimer();
    this._intervalId = setInterval(this.updateTimer.bind(this), 1000); // run update timer every second
  }

  disconnect() {
    clearInterval(this._intervalId); 
  }

  updateTimer() {
    if (this.currentDisplayTime === 0) {
      clearInterval(this._intervalId);
      return;
    }

    this.elapsedTime = Math.floor((Date.now() - this.startTime) / 1000);
    const remainingTime = Math.max(0, this.targetTime - this.elapsedTime);
    this.currentDisplayTime = 60 - this.elapsedTime;

    // Update display element with formatted time (minutes:seconds)
    this.displayTarget.textContent = `${Math.floor(remainingTime / 60)}:${remainingTime % 60}`;
  }

  incrementTimerBy20() {
    this.targetTime = Math.max(0, this.targetTime + 20);
    this.startTime = Date.now();
    this.updateTimer();
  }
  
  decrementTimerBy20() {
    this.targetTime = Math.max(0, this.targetTime - 20);
    this.startTime = Date.now();
    this.updateTimer();
  }

  startPause() {
    if (this.startTime) {
      clearInterval(this._intervalId);
      this.startTime = null;
      return;
    }

    this._intervalId = setInterval(this.updateTimer.bind(this), 1000);
    this.startTime = Date.now() - this.elapsedTime * 1000;
  }
}
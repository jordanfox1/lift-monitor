import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "display", "decrementButton"]
  
  connect() {
    this.initTimer(this.element.dataset.targetTime);
  }
  
  initTimer(amountOfTime) {
    if (this._intervalId) {
      clearInterval(this._intervalId);
    };
    this.timerRunning = true;

    this.targetTime = parseInt(amountOfTime);
    this.startTime = Date.now();
    this.updateTimer();
    
    this._intervalId = setInterval(this.updateTimer.bind(this), 1000); // run update timer every second
  }

  disconnect() {
    clearInterval(this._intervalId); 
  }

  updateTimer() {
    this.disableDecrementButton(); // check whether to disable decrement btn

    this.elapsedTime = Math.floor((Date.now() - this.startTime) / 1000);
    this.remainingTime = Math.max(0, this.targetTime - this.elapsedTime);

    // Update display element with formatted time (minutes:seconds)
    this.displayTarget.textContent = `${Math.floor(this.remainingTime / 60)}:${this.remainingTime % 60}`;
  }

  incrementTimerBy20() {
    this.initTimer(this.targetTime + 20);
  }
  
  decrementTimerBy20() {
    if (this.remainingTime <= 1) {
      return;
    }

    if (this.remainingTime < 20) {
      this.initTimer(this.targetTime - this.remainingTime);
      return;
    };

    this.initTimer(this.targetTime - 20);
  }

  startPause() {
    if (this.timerRunning === true) {
      this.timerRunning = false
      clearInterval(this._intervalId);
      return;
    }

    this.initTimer(this.remainingTime);
  }

  disableDecrementButton() {
    if (this.remainingTime <= 1) {
      this.decrementButtonTarget.disabled = true;
      return;
    }

    this.decrementButtonTarget.disabled = false;
  };
}
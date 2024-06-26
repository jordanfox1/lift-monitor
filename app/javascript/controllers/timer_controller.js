import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "display", "decrementButton", "incrementButton","startPauseButton"];

  connect() {
    this.timerState = "initial"
    this.updateTimerButtonText("Start");
    this.disableDecrementButton();
    this.disableIncrementButton();
  }

  initTimer(amountOfTime) {
    if (this._intervalId) {
      clearInterval(this._intervalId);
    };
    this.timerState = "running";
    this.updateTimerButtonText("Pause");

    this.targetTime = parseInt(amountOfTime);
    this.startTime = Date.now();
    this.updateTimer();

    this._intervalId = setInterval(this.updateTimer.bind(this), 1000); // run update timer every second
  }

  disconnect() {
    clearInterval(this._intervalId);
  }

  updateTimer() {
    this.disableDecrementButton();
    this.disableIncrementButton();

    this.elapsedTime = Math.floor((Date.now() - this.startTime) / 1000);
    this.remainingTime = Math.max(0, this.targetTime - this.elapsedTime);

    // Update display element with formatted time (minutes:seconds)
    this.displayTarget.textContent = `${Math.floor(this.remainingTime / 60)}:${this.remainingTime % 60}`;
  }

  incrementTimerBy20() {
    if (this.timerState == "initial") {
      this.initTimer(20);
      return
    }

    this.initTimer(this.targetTime + 20);
  }

  decrementTimerBy20() {
    if (this.timerState == "initial") {
      return;
    }

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
    if (this.timerState === "running") {
      this.timerState = "paused"
      this.updateTimerButtonText("Start");
      clearInterval(this._intervalId);
      return;
    }

    if (this.timerState === "initial") {
      this.initTimer(this.element.dataset.targetTime);
    }

    this.initTimer(this.remainingTime);
  }

  disableDecrementButton() {
    if (this.timerState !== "running") {
      this.decrementButtonTarget.disabled = true;
      return;
    };

    if (this.remainingTime <= 1) {
      this.decrementButtonTarget.disabled = true;
      return;
    };

    this.decrementButtonTarget.disabled = false;
  };

  disableIncrementButton() {
    if (this.timerState !== "running") {
      this.incrementButtonTarget.disabled = true;
      return;
    };

    this.incrementButtonTarget.disabled = false;
  };

  updateTimerButtonText(newText) {
    this.startPauseButtonTarget.textContent = newText;
  };
}
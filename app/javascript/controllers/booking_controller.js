import { Controller } from "stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["start", "end", "duration"];

  connect() {
    this.startFlatpickr = flatpickr(this.startTarget, {
      dateFormat: 'Y-m-d',
      altInput: true,
      altFormat: 'Y-m-d',
      onChange: this.calculateDuration.bind(this) // This binds the function to the current instance
    });

    this.endFlatpickr = flatpickr(this.endTarget, {
      dateFormat: 'Y-m-d',
      altInput: true,
      altFormat: 'Y-m-d',
      onChange: this.calculateDuration.bind(this) // This binds the function to the current instance
    });
  }

  calculateDuration() {
    const startDate = this.startFlatpickr.selectedDates[0];
    const endDate = this.endFlatpickr.selectedDates[0];

    if (startDate && endDate) {
      const diff = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24));
      this.durationTarget.value = diff > 0 ? diff : ""; // Prevents negative values
    } else {
      this.durationTarget.value = ""; // Clear the field if dates are not valid
    }
  }
}

import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = {userId: Number}
  static targets = ["notifications", "notifbutton", "nonotiification"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: notification => {
        this.#insertMessageAndScrollDown(notification)
        this.#updateNotificationButton()
        this.notificationTarget.hidden = true
       } }
    )
  }

  #updateNotificationButton() {
    this.notifbuttonTarget.classList.remove('all-read')
  }

  #insertMessageAndScrollDown(notification) {
    // Inserting the `message` in the DOM
    this.notificationsTarget.insertAdjacentHTML("beforeend", notification)
  }
}

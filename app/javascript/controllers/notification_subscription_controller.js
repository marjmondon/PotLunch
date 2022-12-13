import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = {userId: Number}
  static targets = ["notifications"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: notification => console.log(notification) }
    )
    console.log(`subscribe ${this.userIdValue}.`)
  }
}

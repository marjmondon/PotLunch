import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = {userId: Number}
  static targets = ["notifications", "notifbutton", "nonotification"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: notification => {
        const shouldHideNotification = this.#isUserInChatroom(notification);
        if (shouldHideNotification.isUserInChatroom) {
          this.#markNotificationAsRead(shouldHideNotification.notificationUrl)
        } else {
          this.#insertMessageAndScrollDown(notification);
          this.#updateNotificationButton();
          this.nonotificationTarget.classList.add("d-none");
        }
       } }
    )
  }

  #markNotificationAsRead(notificationUrl) {
    const notificationId = notificationUrl.searchParams.get('notif')
    fetch(`/notifications/mark_as_read?id=${notificationId}`)
  }

  #isUserInChatroom(notification) {
    const currentUrl = new URL(window.location.href)
    const regex = new RegExp('href="(.*)">')
    const notificationUrlString = notification.match(regex)[1]
    if (!notificationUrlString) return {
      isUserInChatroom: false,
      notificationUrl: null
    };

    const notificationUrl = new URL(`${currentUrl.origin}${notificationUrlString}`)
    return {
      isUserInChatroom: (currentUrl.pathname === notificationUrl.pathname),
      notificationUrl: notificationUrl
    }
  }

  #updateNotificationButton() {
    this.notifbuttonTarget.classList.remove('all-read')
  }

  #insertMessageAndScrollDown(notification) {
    // Inserting the `message` in the DOM
    this.notificationsTarget.insertAdjacentHTML("beforeend", notification)
  }
}

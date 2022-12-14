class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(Notification)
  end

  def mark_as_read
    @notification = Notification.find(params[:id].to_i)
    authorize @notification
    @notification.update(read: true)
    head :ok
  end
end

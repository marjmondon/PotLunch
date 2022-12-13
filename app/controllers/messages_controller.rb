class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @swap = Swap.find(params[:swap_id])
    @message = Message.new(message_params)
    authorize @message
    @message.swap = @swap
    @message.user = current_user
    if @message.save
      @notification = Notification.create(content: "test", swap_id: @swap.id, user_id: @swap.lunch.user.id)
      UserChannel.broadcast_to(
        @notification.user,
        render_to_string(partial: "notifications/notification", locals: {notification: @notification})
      )
      SwapChannel.broadcast_to(
        @swap,
        message: render_to_string(partial: "message", locals: {message: @message}),
        sender_id: @message.user.id
      )
      head :ok
      # redirect_to group_lunch_swap_chatroom_messages_path(@chatroom)
    else
      render "swaps/chatroom", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

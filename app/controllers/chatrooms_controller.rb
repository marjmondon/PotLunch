class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   authorize @chatroom
  #   @chatroom = Chatroom.find(params[:id])
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end
end

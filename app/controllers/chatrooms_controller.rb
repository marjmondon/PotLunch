class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: %i[show]

  def show
    @message = Message.new
  end

  def new
    @swap = Swap.new
    @chatroom = Chatroom.new
    @lunch = Lunch.find(params[:lunch_id])
    authorize @chatroom
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end

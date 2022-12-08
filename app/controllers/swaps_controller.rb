class SwapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @swaps = policy_scope(Swap)
    @lunches = Lunch.where(user: current_user)
    @swaps = Swap.where(lunch_id: @lunches)
    @swaps_asked = Swap.where(user_id: current_user)
    start_date = params.fetch(:start_date, Date.today).to_date
    @swaps_calendar = Swap.where(delivery_date: start_date.beginning_of_week..start_date.end_of_week)
    # raise
  end

  def new
    @swap = Swap.new
    @lunch = Lunch.find(params[:lunch_id])
    authorize @swap
  end

  def create
    @swap = Swap.new(swap_params)
    # @swap.requested!
    @lunch = Lunch.find(params[:lunch_id])
    @swap.lunch = @lunch
    @swap.user = current_user
    authorize @swap
    if @swap.save
      redirect_to group_lunches_path(@lunch.group), notice: 'Your swap request was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @swap = Swap.find(params[:id])
    authorize @swap
    if @swap.update(swap_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # show de la chatroom
  def chatroom
    @swap = Swap.find(params[:swap_id])
    authorize @swap
    @message = Message.new
  end

  def initiate_chat
    @swap = Swap.new
    @swap.user = current_user
    @lunch = Lunch.find(params[:lunch_id])
    @swap.lunch = @lunch
    authorize @swap
    if @swap.save
      redirect_to swap_chatroom_path(@swap)
    else
      redirect_to group_lunch_path(@lunch.group, @lunch), notice: "something went wrong try again later"
    end
  end

  private

  def swap_params
    params.require(:swap).permit(:user_id, :lunch_id, :delivery_date, :status, :start_date)
  end
end

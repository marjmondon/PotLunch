class SwapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lunch, only: %i[new create]

  def index
    @swaps = policy_scope(Swap)
    @lunches = Lunch.where(user: current_user)
    @swaps = Swap.where(lunch_id: @lunches)
    @swaps_asked = Swap.where(user_id: current_user)
    start_date = params.fetch(:start_date, Date.today).to_date
    @swaps_calendar = Swap.where(delivery_date: start_date.beginning_of_week..start_date.end_of_week)
  end

  def new
    @swap = Swap.new
    authorize @swap

    if current_user.coins < 10
      flash[:alert] = "Mmh 🤔 seems like you don't have enough LunchCoins"
      redirect_to group_lunches_path(@lunch.group)
    end
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.lunch = @lunch
    @swap.user = current_user
    @swap.requested!
    authorize @swap

    if @swap.save
    #   if current_user == @swap.lunch.user
    #     notif_user = @swap.user
    #   else
    #     notif_user = @swap.lunch.user
    #   end

    #   @notification = Notification.create(content: "Message: ", swap_id: @swap.id, user: notif_user)
    #   UserChannel.broadcast_to(
    #     @notification.user,
    #     render_to_string(partial: "notification", locals: {notification: @notification})
    #   )
      new_coins_current_user = current_user.coins - 10
      current_user.update!(coins: new_coins_current_user)
      redirect_to group_lunches_path(@lunch.group), notice: 'Your swap request was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @swap = Swap.find(params[:id])
    authorize @swap
    if @swap.update(swap_params)
      if @swap.status == "accepted"
        new_coins_current_user = current_user.coins + 10
        current_user.update!(coins: new_coins_current_user)
      end

      @swap.destroy if @swap.status == "refused"
      redirect_to swap_chatroom_path(@swap)
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
    @swap.delivery_date = Date.today
    authorize @swap
    if @swap.save
      new_coins_current_user = current_user.coins - 10
      current_user.update!(coins: new_coins_current_user)
      redirect_to swap_chatroom_path(@swap)
    else
      redirect_to group_lunch_path(@lunch.group, @lunch), notice: "something went wrong try again later"
    end
  end

  private

  def set_lunch
    @lunch = Lunch.find(params[:lunch_id])
  end

  def swap_params
    params.require(:swap).permit(:user_id, :lunch_id, :delivery_date, :status, :start_date)
  end
end

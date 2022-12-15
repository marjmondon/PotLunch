class SwapsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lunch, only: %i[new create]
  before_action :set_groups

  def index
    # @swaps = policy_scope(Swap)
    # @lunches_without_swap = Lunch.left_outer_joins(:swaps).where(user: current_user).where(swaps: { id: nil })
    @lunches = Lunch.where(user: current_user)
    @lunches_without_swap = @lunches.select { |lunch| lunch.swaps.empty? }
    @swaps = policy_scope(Swap).where(lunch_id: @lunches)
    @swaps_asked = Swap.where(user_id: current_user)
    start_date = params.fetch(:start_date, Date.today).to_date
    @swaps_calendar = Swap.where(delivery_date: start_date.beginning_of_week..start_date.end_of_week)

    if params[:notif].present?
      @notification = Notification.find(params[:notif].to_i)
      @notification.update(read: true)
    end
  end

  def new
    @swap = Swap.new
    authorize @swap

    if current_user.coins < 10
      flash[:info] = "Mmh 🤔 seems like you don't have enough LunchCoins."
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

      if current_user == @swap.lunch.user
        notif_user = @swap.user
      else
        notif_user = @swap.lunch.user
      end

      if @swap.notifications.all? { |n| n.read } || @swap.notifications.empty?
        @notification = Notification.create(content: "Lunch Requested: ", swap_id: @swap.id, user: notif_user, category: "swap")
        UserChannel.broadcast_to(
          @notification.user,
          render_to_string(partial: "notifications/notification", locals: {notification: @notification})
        )
      end
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

      if params[:notif].present?
        @notification = Notification.find(params[:notif].to_i)
        @notification.update(read: true)
      end

      if current_user == @swap.lunch.user
        notif_user = @swap.user
      else
        notif_user = @swap.lunch.user
      end

      if @swap.accepted?
        new_coins_current_user = current_user.coins + 10
        current_user.update!(coins: new_coins_current_user)


          if @swap.notifications.all? { |n| n.read } || @swap.notifications.empty?
            @notification = Notification.create(content: "Lunch Accepted: ", swap_id: @swap.id, user: notif_user, category: "swap")
            UserChannel.broadcast_to(
              @notification.user,
              render_to_string(partial: "notifications/notification", locals: {notification: @notification})
            )
          end
        redirect_to swaps_path, notice: 'Swap have been accepted.'
      end

      if @swap.refused?
        new_coins_user = @swap.user.coins + 10
        @swap.user.update!(coins: new_coins_user)

        if @swap.notifications.all? { |n| n.read } || @swap.notifications.empty?
          @notification = Notification.create(content: "Lunch Refused: ", swap_id: @swap.id, user: notif_user, category: "swap")
          UserChannel.broadcast_to(
            @notification.user,
            render_to_string(partial: "notifications/notification", locals: { notification: @notification })
          )
        end
        redirect_to swaps_path, notice: 'Swap have been refused.'
      end

      # @swap.destroy if @swap.refused?
      # redirect_to swap_chatroom_path(@swap)

    else
      render :edit, status: :unprocessable_entity
    end
  end

  # show de la chatroom
  def chatroom
    @swap = Swap.find(params[:swap_id])
    authorize @swap
    @message = Message.new
    if params[:notif].present?
      @notification = Notification.find(params[:notif].to_i)
      @notification.update(read: true)
    end
  end

  def initiate_chat
    @swap = Swap.new
    @swap.user = current_user
    @lunch = Lunch.find(params[:lunch_id])
    @swap.lunch = @lunch
    @swap.delivery_date = Date.today
    authorize @swap

    if current_user.coins.zero?
      flash[:alert] = "Mmh 🤔 seems like you don't have any LunchCoins"
      redirect_to group_lunches_path(@lunch.group)
    elsif @swap.save
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

  def set_groups
    @usergroups = Usergroup.where(user_id: current_user)
    @groups = []
    @usergroups.each do |usergroup|
      @groups << usergroup.group
    end
  end
end

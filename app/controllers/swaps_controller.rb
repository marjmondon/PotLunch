class SwapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @swaps = policy_scope(Swap)
    @lunches = Lunch.where(user: current_user)
    @swaps = Swap.where(lunch_id: @lunches)
    @swaps_asked = Swap.where(user_id: current_user)
  end

  def new
    @swap = Swap.new
    @lunch = Lunch.find(params[:lunch_id])
    authorize @swap
  end

  def create
    @swap = Swap.new(swap_params)
    # @swap.requested!
    @group = Group.find(params[:group_id])
    @lunch = Lunch.find(params[:lunch_id])
    @swap.lunch = @lunch
    @swap.user = current_user
    authorize @swap
    if @swap.save
      # TODO :redéfinir la redirection vers dashboard ou autre
      redirect_to group_lunch_swaps_path([@group, @lunch]), notice: 'Your swap request was successfully created.'
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

  private

  def swap_params
    params.require(:swap).permit(:user_id, :lunch_id, :delivery_date, :status)
  end
end

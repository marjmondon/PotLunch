class SwapsController < ApplicationController

  def index
    @swaps = policy_scope(Swap)
    @lunches = Lunches.where(user: current_user)
    @swaps = Swap.where(lunch_id: @lunches)
  end

  def new
    @swap = Swap.new
    authorize @swap
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.requested!
    authorize @swap
  end

  private

  def swap_params
    params.require(:swap).permit(:user_id, :lunch_id, :delivery_date)
  end
end

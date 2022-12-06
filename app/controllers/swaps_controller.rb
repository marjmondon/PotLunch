class SwapsController < ApplicationController

  def index
    raise
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

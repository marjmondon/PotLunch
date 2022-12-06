class SwapsController < ApplicationController

  def index
    raise
  end

  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.requested!
  end

  private

  def swap_params
    params.require(:swap).permit(:user_id, :lunch_id, :delivery_date)
  end
end

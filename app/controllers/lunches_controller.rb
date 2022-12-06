class LunchesController < ApplicationController
  def index
    @lunches = policy_scope(Lunch)
  end

  def show
    authorize @lunch
  end

  def new
    @lunch = Lunch.new
    authorize @lunch
  end

  def create
    @lunch = Lunch.new(lunch_params)
    @luch.user = current_user
    authorize @lunch
  end

  def edit
    authorize @lunch
  end

  def update
    authorize @lunch
  end

  def destroy
    authorize @lunch
  end
end

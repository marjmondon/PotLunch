class LunchesController < ApplicationController
  def show
    authorize @lunch
  end

end

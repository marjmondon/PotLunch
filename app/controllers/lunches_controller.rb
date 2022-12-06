class LunchesController < ApplicationController
  before_action :set_lunch, only: %i[show edit update destroy]

  def index
    @lunches = policy_scope(Lunch)
  end

  def show
  end

  def new
    @lunch = Lunch.new
    authorize @lunch
  end

  def create
    @lunch = Lunch.new(lunch_params)
    @lunch.user = current_user
    authorize @lunch
    if @lunch.save
      redirect_to root_path, notice: 'Your lunch was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lunch.update(edit_lunch_params)
      if params[:lunch][:photos].present?
        params[:lunch][:photos].each do |photo|
          @lunch.photos.attach(photo)
        end
      end
      redirect_to @lunch, notice: "Your lunch was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lunch.destroy
    redirect_to group_lunches_path, status: :see_other
  end

  private

  def set_lunch
    @lunch = Lunch.find(params[:id])
    authorize @lunch
  end

  def edit_lunch_params
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :tags)
  end

  def lunch_params
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :tags, photos: [])
  end

end

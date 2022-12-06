class LunchesController < ApplicationController
  before_action :set_lunch, only: %i[show edit update destroy]

  def index
    @lunches = policy_scope(Lunch)
    @group = policy_scope(Group)
    @group = Group.find(params[:group_id])
    @lunches = @group.lunches
  end

  def show
    @group = Group.find(params[:group_id])
    @lunch = Lunch.find(params[:id])
  end

  def new
    @lunch = Lunch.new
    @group = Group.find(params[:group_id])
    authorize @lunch
  end

  def create
    @lunch = Lunch.new(lunch_params)
    @lunch.user = current_user
    @group = Group.find(params[:group_id])
    @lunch.group = @group
    authorize @lunch

    if @lunch.save
      redirect_to group_lunches_path(@group), notice: 'Your lunch was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
    # TODO la ligne 36 pour afficher sur ma page index
    @group = Group.find(params[:group_id])
    if @lunch.update(edit_lunch_params)
      if params[:lunch][:photos].present?
        params[:lunch][:photos].each do |photo|
          @lunch.photos.attach(photo)
        end
      end
       # TODO a rediriger vers show:  redirect_to group_lunch_path(@lunch)
      redirect_to group_lunches_path(@group), notice: "Your lunch was successfully updated."
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
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :lunch_id, :tags, :user_id, photos: [])
  end

  def lunch_params
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :lunch_id, :tags, :user_id, photos: [])
  end

end

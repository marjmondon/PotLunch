class LunchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lunch, only: %i[show edit update destroy]
  before_action :set_group
  before_action :set_groups

  def index
    # @lunches = policy_scope(Lunch)
    # @group = policy_scope(Group)
    # @group = Group.find(params[:group_id])
    # @lunches = @group.lunches
    @group = policy_scope(Group).find(params[:group_id])
    @lunches = policy_scope(Lunch).where("group_id = ? ", params[:group_id])
  end

  def show
    @swap = Swap.where(lunch_id: @lunch).where.not(status: :refused)
  end

  def new
    @lunch = Lunch.new
    @group = Group.find(params[:group_id])
    authorize @lunch
  end

  def create
    @lunch = Lunch.new(lunch_params)
    @lunch.user = current_user
    @lunch.group = @group
    authorize @lunch
    @lunches = Lunch.where(user_id: current_user)
    current_user.update!(coins: 10) if @lunches.count.zero?

    if @lunch.save
      redirect_to group_lunches_path(@group), notice: 'Your lunch was successfully created.'
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
      redirect_to group_lunch_path([@group, @lunch]), notice: "Your lunch was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @group = Group.find(params[:group_id])
    @lunch.destroy
    redirect_to group_lunches_path(@group), status: :see_other
  end

  private

  def set_lunch
    @lunch = Lunch.find(params[:id])
    authorize @lunch
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_groups
    @usergroups = Usergroup.where(user_id: current_user)
    @groups = []
    @usergroups.each do |usergroup|
      @groups << usergroup.group
    end
  end

  def edit_lunch_params
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :lunch_id, :user_id, tags: [])
  end

  def lunch_params
    params.require(:lunch).permit(:cooking_date, :title, :description, :recipe_url, :lunch_id, :user_id, tags: [], photos: [])
  end
end

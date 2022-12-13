class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    policy_scope(Group)
    @groups = Usergroup.where(user: current_user).map(&:group)
    # raise
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    authorize @group
    @usergroup = Usergroup.new(user: current_user, group: @group)
    if @usergroup.save
      redirect_to group_lunches_path(@group), notice: "#{@group.name} group was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @group
  end

  def update
    authorize @group
  end

  def destroy
    authorize @group
  end

  private

  def group_params
    params.require(:group).permit(:name, :photo)
  end
end

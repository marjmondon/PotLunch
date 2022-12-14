class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    policy_scope(Group)
    @groups = current_user.groups
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      @usergroup = Usergroup.new(user: current_user, group: @group)
      @usergroup.save
      redirect_to group_lunches_path(@group), notice: "#{@group.name} group was successfully created."
    else
      @groups = current_user.groups
      render :index, status: :unprocessable_entity
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

  def join
    @group = Group.find(params[:group_id])
    authorize @group
    if @group.users.include?(current_user)
      flash[:info] = "Mmh 🤔 seems like you already belong to #{@group.name}."
      redirect_to root_path
    else
      @usergroup = Usergroup.new(user: current_user, group: @group)
      if @usergroup.save
        redirect_to group_lunches_path(@group), notice: "You have successfully joined #{@group.name}."
      else
        render :join, status: :unprocessable_entity
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :photo)
  end
end

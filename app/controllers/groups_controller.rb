class GroupsController < ApplicationController
  def index
    @groups = policy_scope(Group)
  end

  def show
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    authorize @group
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
end

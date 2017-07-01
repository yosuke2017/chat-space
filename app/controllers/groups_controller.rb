class GroupsController < ApplicationController
  def index
   @groups = current_user.groups
  end

  def new
   @group = Group.new
   @user = User.new
  end

  def create
    Group.create(create_params)
    redirect_to root_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(update_params)
    redirect_to root_path
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def update_params
    params.require(:group).permit(:name,user_ids: [])
  end
end

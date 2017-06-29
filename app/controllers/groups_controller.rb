class GroupsController < ApplicationController
  def index
   @messages = Message.new
   @group = Group.find(1)
  end

  def new
   @groups = Group.new
  end

  def create
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    @group.update(update_params)
    redirect_to :index
  end

  private
  def update_params
    params.require(:group).permit(:name)
  end
end

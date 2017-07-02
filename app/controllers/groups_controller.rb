class GroupsController < ApplicationController
  def index
   @groups = current_user.groups
  end

  def new
   @group = Group.new
   @user = User.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(update_params)
    redirect_to root_path, notice: "グループを編集しました"
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def update_params
    params.require(:group).permit(:name,user_ids: [])
  end
end


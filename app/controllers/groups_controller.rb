class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
    @message =
  end

  def new
   @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :edit
    end
  end

  private

    def set_group
     @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

end


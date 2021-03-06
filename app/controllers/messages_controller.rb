class MessagesController < ApplicationController
 before_action :set_message_group

  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "メッセージを送信しました" }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
   params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_message_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id]).includes(:group)
  end

end


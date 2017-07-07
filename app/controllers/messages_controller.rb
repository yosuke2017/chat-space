class MessagesController < ApplicationController
 before_action :set_message_group

 def index
  @message = Message.new
 end

 def create
  @message = Message.new(message_params)
  if @message.save
    redirect_to group_messages_path(@group), notice: "メッセージを送信しました"
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
    @messages = Message.where(group_id: params[:group_id])
  end

end


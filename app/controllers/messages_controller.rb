class MessagesController < ApplicationController
 def index
  @message = Message.new
  @groups = current_user.groups
  @group = Group.find(params[:group_id])
 end

 def new

 end

 def create
  @groups = current_user.groups
  @group = Group.find(params[:group_id])
  @message = Message.new(message_params)
  if @message.save
    redirect_to group_messages_path(@group)
  else
    flash.now[:alert] = "メッセージを入力してください"
    render :index
  end
 end

 private

  def message_params
   params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end


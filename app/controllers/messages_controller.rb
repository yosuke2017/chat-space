class MessagesController < ApplicationController
 def index
  @message = Message.new
  @groups = current_user.groups
  @group = Group.find(params[:group_id])
 end

 def new
 end

 def create
 end

 def edit
 end

 def update
 end

 private
 def update_params
   params.require(:group).permit(:name, user_ids: [])
 end
end


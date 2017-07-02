class MessagesController < ApplicationController
 def index
  @message = Message.new
  @groups = current_user.groups
  @group = Group.find(params[:group_id])
 end

end


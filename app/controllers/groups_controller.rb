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
  end
end

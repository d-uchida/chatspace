class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(params[:table])
  end

def message_params
end


end
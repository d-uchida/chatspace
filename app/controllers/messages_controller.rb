class MessagesController < ApplicationController

  def index
    @message = Message.new
    @groups = current_user.groups
  end

  def new
    @message = Message.new
  end

  def show
    @messages = Messages.find(params[:id])
  end

  def create
    Message.create(text: params[:text], image: params[:image], group_id: params[:group_id], user_id: current_user.id)
    redirect_to group_messages_path(:group_id)
  end

  private
  def message_params
    params.permit(:text, :image, :group_id)
  end

end
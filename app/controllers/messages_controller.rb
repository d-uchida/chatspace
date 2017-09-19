class MessagesController < ApplicationController

  def index
    @message = Message.new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def new
    @message = Message.new
  end

  def show
    @messages = Messages.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to group_messages_path

    # Message.create(text: params[:text], image: params[:image], group_id: params[:group_id], user_id: current_user.id)
    # redirect_to group_messages_path(:group_id),method: :post
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

end
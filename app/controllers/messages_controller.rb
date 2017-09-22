class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)

    if @message.save
      redirect_to group_messages_path
    else
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
      flash.now[:alert] = "メッセージを入力してください"
      render :action => :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:image, :text).merge(group_id: params[:group_id])
  end
end
class MessagesController < ApplicationController

  before_action :group_params, :current_user_groups, only: [:index, :create]

  def index
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.group = @group

    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:image, :text)
  end
  def group_params
    @group = Group.find(params[:group_id])
  end
  def current_user_groups
    @groups = current_user.groups
  end
end


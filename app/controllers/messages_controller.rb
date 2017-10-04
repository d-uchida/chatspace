class MessagesController < ApplicationController

  before_action :group_params, :current_user_groups, only: [:index, :create]

  def index
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do|format|
        format.html
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:image, :text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  def group_params
    @group = Group.find(params[:group_id])
  end
  def current_user_groups
    @groups = current_user.groups
  end
end


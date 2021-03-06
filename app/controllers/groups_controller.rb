class GroupsController < ApplicationController

  before_action :find_id, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
  	  redirect_to group_messages_path(@group), notice: "グループを作成しました"
    else
      render "new"
    end
  end

  def edit
  end

  def update
     if @group.update(group_params)
       redirect_to group_messages_path(@group)
     else
      render "edit"
     end
  end

  private
  def group_params
  	params.require(:group).permit(:name, {user_ids: []})
  end

  def find_id
    @group = Group.find(params[:id])
  end


end

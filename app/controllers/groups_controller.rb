class GroupsController < ApplicationController
  def create
  end

  def new
    @group = Group.new
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

  def group_params
  	params.require(:group).permit(:name, {user_ids: []})
  end
end

class GroupsController < ApplicationController
  def create
  end

  def new
    @group = Group.new
  end

  def create
  	# render plain: params[@group].inspect
  	@group = Group.new(group_params)
  	@group.save
  	redirect_to messages_path
  end

  def edit
  end

  def group_params
  	params.require(:group).permit(:name, :id)
  end
end

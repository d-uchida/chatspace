class GroupsController < ApplicationController
  def create
  end

  def new
    @group = Group.new
  end

  def edit
  end

  #   private
  # def group_params
  # 	params.require(:group).permit(:name, :id)
  # end
end

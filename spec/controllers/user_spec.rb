require 'rails_helper'
describe UsersController do
  before :each do
    user = create(:admin)
    session[:user_id] = user_id
  end

  describe 'GET #index' do
    it "has an instance variable defined in the action" do
      get :update, id: 1
    end
  	it "renders the :group template" do
  	end
  end
end
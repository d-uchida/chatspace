require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:message) { create(:message)}
  let(:group) { create(:group) }
  let(:messages) { create(:messages)}
  let(:text) { create(:text) }
  let(:image) { create( :image ) }

  describe 'GET #index' do
    before do
      login_user user
    end

    it "assigns the requested contact to @groups" do
      @group = user.groups.first
      get :index, params: { group_id: group }
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end
  end
  
  describe 'GET #index' do
    before do
      login_user user
    end

    it "renders the :index template" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end
  end


  describe 'GET #index' do
    it "renders login view" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end
    it "saves a message" do
      expect do
        post :create, params: { message: attributes_for(:message), group_id: group }
      end.to change(Message, :count).by(1)
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end
    it "renders message index" do
      post :create, params: { message: attributes_for(:message), group_id: group}

      expect(response).to redirect_to group_messages_path

    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end
    it "couldn't save the message" do
      expect do
        post :create, params: { message: {text: "", image: ""}, group_id: group}
      end.to change(Message, :count).by(0)
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end
    it "moves to renders index" do
      post :create, params: { message: {text: "", image: ""}, group_id: group}
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index, params: { group_id: group }
      expect(response).to redirect_to new_user_session_path
    end
  end
end


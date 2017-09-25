require 'rails_helper'
require 'support/controller_macros'

describe Message do
  describe '#create' do
    it "is valid with a message" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end
  end
  describe '#create' do
    it "is valid with an image" do
      message = build(:message, text: "")
    end
  end
  describe	 '#create' do
  	it "is valid with a message and image" do
  	  message = build(:message)
  	  expect(message).to be_valid
  	end
  end
  describe '#create' do
  	it "is invalid without any message and image" do
    message = build(:message, text:"", image:"")
    expect(message).to be_invalid
  	end
  end
  describe '#create' do
  	it "is invalid without group_id" do
  	message = build(:message, group_id: "")
  	expect(message).to be_invalid
  	end
  end
  describe '#create' do
  	it "is invalid without user id" do
  	  message = build(:message, user_id: "")
      expect(message).to be_invalid
  	end
  end
end


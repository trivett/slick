require 'rails_helper'

describe API::V1::MessagesController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.slick.v1" }

  # describe "create message" do
  #   before(:each) do
      
  #     @user = FactoryGirl.create :user
  #     @conversation = FactoryGirl.create :conversation
  #     message_content = { FFaker::HipsterIpsum.phrase }
  #     post :create, { message: {content: message_content, user_id: @user.id, conversation_id:   }} 
  #   end

  #   it "allows users to create new messages inside conversations" do



  #   end
  # end


end
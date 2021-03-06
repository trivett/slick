require 'rails_helper'

describe API::V1::ConversationsController, type: :controller do

  before(:each) { request.headers['Accept'] = "application/vnd.slick.v1, #{Mime::JSON}" }

  describe "Listing available conversations" do
    before(:each) do      
      @conversations = FactoryGirl.create_list(:conversation, 5)
      get :index, format: :json
    end

    it "responds with all all of the conversatoins" do
      parsed_response = json_response
      expect(parsed_response.length).to eq(5)
    end
  end

  describe "show the users in a conversation" do
    before(:each) do
      @conversation = FactoryGirl.create :conversation
      @users = FactoryGirl.create_list(:user, 5)

      @users.each do |u|
        @conversation.users << u
      end

      get :users, conversation_id: @conversation.id, format: :json
    end

    context "successfully" do
      it "displays the right number of users" do
        parsed_response = json_response
        expect(parsed_response.length).to eq(5)
      end
    end
  end

  describe "show the messages in a conversation" do
    before(:each) do
      @conversation = FactoryGirl.create :conversation
      @messages = FactoryGirl.create_list(:message, 5)

      @messages.each do |u|
        @conversation.messages << u
      end

      get :messages, conversation_id: @conversation.id, format: :json
    end

    context "successfully" do
      it "displays the right number of messages" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.length).to eq(5)
      end
    end
  end

  describe "Conversation creation" do
    context "successfully" do
      before(:each) do
        @conversation_attributes = FactoryGirl.attributes_for :conversation
        post :create, { conversation: @conversation_attributes }, format: :json
      end

      it "renders the newborn conversation" do
        parsed_response = json_response
        expect(parsed_response[:name]).to eql @conversation_attributes[:name]
      end
      it { should respond_with 201 }
    end
  end
end







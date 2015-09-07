require 'rails_helper'

describe API::V1::ConversationsController ,type: :controller do

  before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

  describe "Listing available conversations" do
    before(:each) do      
      @conversations = FactoryGirl.create_list(:conversation, 5)
      get :index, format: :json
    end

    it "responds with all all of the conversatoins" do
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response.length).to eq(5)
    end
  end

  describe "render the conversation" do
    before(:each) do
      @conversation = FactoryGirl.create :conversation
      get :show, id: @conversation.id, format: :json 
    end

    it "renders a single conversation with the right name" do
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:name]).to eql @conversation.name
    end
    it { should respond_with 200 }
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
        parsed_response = JSON.parse(response.body)
          i = 0
        parsed_response.each do |p|
          puts p
          puts "______"
          i += 1
          puts i
        end
        
        expect(parsed_response.length).to eq(5)
      end
    end
  end
end
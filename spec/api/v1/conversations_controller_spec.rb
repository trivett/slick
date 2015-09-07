require 'rails_helper'

describe Api::V1::ConversationsController ,type: :controller do

  before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

  describe "Listing available conversations" do
    before(:each) do      
      FactoryGirl.create_list(:conversation, 5)
      get :index, format: :json
    end

    it "responds with all all of the users" do
      response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response.length).to eq(5)
    end
  end

  describe "render the conversation and its users" do
    before(:each) do
      @users = FactoryGirl.create_list(:user, 5)
      @conversation = FactoryGirl.create :conversation

      @users.each do |u|
        @conversation.users << u
      end

      get :show, format: :json 
    end

    it "renders a single conversation" do
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:name]).to eql @conversation.name
    end

    # it "renders the users along with the conversation name" do 

    # end
  end
end


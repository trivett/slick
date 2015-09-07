require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.marketplace.v1" }

  describe "list users at index" do
    before(:each) do
      FactoryGirl.create_list(:user, 5)
      get :index, format: :json
    end

    it "returns all the users" do
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response.length).to eq(5)
    end

    it { should respond_with 200 }
  end
  describe "show a single user" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it "show's the user's info" do
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end


  describe "User creation" do
    context "successfully" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end

      it "renders the newborn user" do
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "unsuccessful due to no email" do
      before(:each) do
        @user_attrs = { password: "secretsauce",password_confirmation: "secretsauce" }
        post :create, { user: @user_attrs }, format: :json
      end

      it "shows an error" do
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response).to have_key(:errors)
      end

      it "includes proper error info" do
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:errors][:email]).to include "can't be blank"
      end
    end

    context "unsuccessful due to bad password" do
      before(:each) do
        @user_attrs = { email: "person@email.com", password: "secretsauce",password_confirmation: "escritsauce" }
        post :create, { user: @user_attrs }, format: :json
      end

      it "shows an error" do
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response).to have_key(:errors)
      end

      it "includes proper error info" do
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        puts parsed_response
        expect(parsed_response[:errors][:password_confirmation]).to include "doesn't match Password"
      end

      it { should respond_with 422 }
    end
  end
end



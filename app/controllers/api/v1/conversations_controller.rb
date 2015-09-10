class API::V1::ConversationsController < ApplicationController
  respond_to :json

  def index
    @conversations = Conversation.all
    render json: @conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def users
    @conversation = Conversation.find(params[:conversation_id])
    @users = @conversation.users
    render json: @users
  end

  def messages
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    render json: @messages
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      render json: @conversation, status: 201, location: [:api, @conversation]
    else
      render json: { errors: @conversation.errors }, status: 422
    end
  end

  def admit_user
    @user = User.find(params[:user_id])
    @conversation = Conversation.find(params[:user_id])
    #refactor to make sure we don't add the same user twice
      @conversation.users << @user
    
    render json: @conversation.users
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name)
  end

end

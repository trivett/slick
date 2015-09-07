class API::V1::ConversationsController < ApplicationController
  respond_to :json

  def index
    @conversations = Conversation.all
    render json: @conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    render json: @conversation
  end

  def users
    @conversation = Conversation.find(params[:conversation_id])
    @users = @conversation.users
    render json: @users
  end

end

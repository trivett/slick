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

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      render json: @conversation, status: 201, location: [:api, @conversation]
    else
      render json: { errors: @conversation.errors }, status: 422
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name)
  end

end

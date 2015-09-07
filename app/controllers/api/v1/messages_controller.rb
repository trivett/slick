class API::V1::MessagesController < ApplicationController
  respond_to :json

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @user = User.find(params[:user_id])
    @message = Message.create(user_id: @user.id, conversation_id: @conversation.id, content: message_params[:content])
      # @user.messages << @message 
      # @conversation.messages << @message
    if @message.save

      render json: @converation, status: 201, location: [:api, @conversation]
    else
      render json: {errors: @message.errors }, status: 422
    end
  end



  private

  def message_params
    params.require(:message).permit(:content)
  end
end
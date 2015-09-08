class API::V1::MessagesController < ApplicationController
  respond_to :json

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @user = User.find(params[:user_id])
    @message = Message.create(user_id: @user.id, conversation_id: @conversation.id, content: message_params[:content])

      render json: @message, status: 201, location: [:api, @conversation]
  end



  private

  def message_params
    params.require(:message).permit(:content)
  end
end
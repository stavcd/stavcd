class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.between(current_user.id, params[:user_id])
    @message = Message.new
    @user = User.new(id: params[:user_id])
  end

  def create
    @message = Message.create!(message_params.merge(sender_id: current_user.id, recipient_id: params[:user_id]))
    redirect_to user_messages_path(params[:user_id])
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end

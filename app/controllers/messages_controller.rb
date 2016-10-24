class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all
    @groups = Group.all
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to root_path, notice: 'SUCCESS'
    else
      redirect_to root_path, alert: 'エラー'
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, group_id: 1)
  end

end

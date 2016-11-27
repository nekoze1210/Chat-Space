class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups
    @user_names = @group.users.map(&:nickname)
    @message = Message.new
    @messages = @group.messages.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @messages.includes(:user).map(&:to_api_json) }
    end
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html do
          redirect_to group_messages_path(@group), notice: 'メッセージを送信しました'
        end
        format.json do
          render json: @message.to_api_json
        end
      end
    else
      flash[:alert] = 'メッセージ送信に失敗しました'
      redirect_to group_messages_path(@group)
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :thumbnail).merge(user_id: current_user.id, group_id: 1)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end

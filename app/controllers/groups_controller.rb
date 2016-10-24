class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。一覧からトークを開始してください。'
    else
      flash[:alert] = 'グループを作成できませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to root_path, notice: 'グループ情報を更新しました。'
  end

  private
  def group_params
    params.require(:group).permit(:title, { user_ids: [] } )
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @place = Place.find(@group.place_id)
    @users = @group.users
    @mainuser = User.find(@group.mainuser_id)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'グループは更新されました。'
      redirect_to group_path(@group.id)
    else
      render :edit
    end
  end

  def join
    @group = Group.find(params[:id])
    if UserGroup.exists?(user_id: current_user.id, group_id: @group.id)
      flash[:notice] = 'あなたは既にこのグループに参加しています。'
      redirect_to group_path(@group.id)
    elsif @group.users.count < @group.people
      @group.users << current_user
      redirect_to group_path(@group.id)
    else
      flash[:notice] = 'このグループは満員です。'
      redirect_to group_path(@group.id)
    end
  end

  def chat
    @group = Group.find(params[:id])
    if UserGroup.exists?(user_id: current_user.id, group_id: @group.id)
    @chat = Chat.new
    @place = Place.find(@group.place_id)
    else
    flash[:notice] = 'あなたはこのグループに参加していません｡'
    redirect_to group_path(@group.id)
    end
  end

  def create
    @group = Group.new(group_params)
    @group.mainuser_id = current_user.id
    @user = User.find(current_user.id)
    @group.mainuser_name = @user.name
    @group.users = [current_user]
    @group.save
    flash[:notice] = 'グループは作製されました。'
    redirect_to group_path(@group.id)
  end

  def index
    @q = Group.ransack(params[:q])
    if params[:latest]
      @groups = Group.latest
    elsif params[:old]
      @groups = Group.old
    elsif params[:title]
      @groups = Group.title
    else
      @groups = @q.result(distinct: true)
    end
  end

  def destroy
    group = Group.find(params[:id])
    if group.mainuser_id = current_user.id
      group.destroy
      flash[:notice] = 'このグループは削除されました。'
      redirect_to user_path(current_user.id)
    else
      redirect_to group_path(group.id)
    end
  end

  private
  def group_params
    params.require(:group).permit(:people, :theatre, :sex, :movie, :memo, :time, :place_id, user_ids:[])
  end

end

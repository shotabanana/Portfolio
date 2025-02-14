class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @group_new = Group.new
    @groups = @user.groups
    @places = Place.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'プロフィールは更新されました。'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :sex, :age)
  end

end

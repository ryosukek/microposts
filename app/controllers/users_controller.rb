class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    @user.update(user_params)
    redirect_to user_path(@user) , notice: 'アカウント情報を更新しました。'
  end
  
  def followings
    @followings = @user.following_users
  end
  
  def followers
    @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
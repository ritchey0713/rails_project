class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
      @games = @user.game
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :console, :goal)
  end

end

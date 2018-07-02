class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    if current_user 
      @user = current_user
      @games = current_user.games
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(name: user_params[:name])
    binding.pry
    if @user.update(user_params)
      binding.pry
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :console, :goal)
  end

end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def show
    if logged_in
      @user = current_user
      @games = current_user.games
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      render 'users/edit'
    end 
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
  end
end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :console, :goal)
  end

end

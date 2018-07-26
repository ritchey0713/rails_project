class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :show
    else
      render 'users/new'
    end
  end

  def show
    if current_user
      @user = current_user
      @games = current_user.games
      respond_to do |f|
        f.html{render :show}
        f.json {render json: @user}
      end
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(name: user_params[:name])
    if @user.update(user_params)
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

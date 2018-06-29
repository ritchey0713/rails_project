class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = request.env["omniauth.auth"]
      render 'users/edit'

    else
      @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
      end
    end

  def destroy
    session.clear
    redirect_to root_path
  end
end

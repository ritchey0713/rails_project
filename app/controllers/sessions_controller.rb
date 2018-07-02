class SessionsController < ApplicationController

  def new
    if request.env["omniauth.auth"]
      @user = User.new(name: request.env["omniauth.auth"][:info][:name], password: SecureRandom.hex(8))
      @user.save
      redirect_to 'users/new_github'
    else
      @user = User.new
    end
  end

  def create
    if request.env["omniauth.auth"]
      #binding.pry
      user = request.env["omniauth.auth"][:info][:name]
      if @user = User.find_by(name: user)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
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

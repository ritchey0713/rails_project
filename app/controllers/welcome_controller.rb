class WelcomeController < ApplicationController

  def home
    @user = current_user
     if logged_in
      redirect_to user_path(current_user)
       end 
  end

end

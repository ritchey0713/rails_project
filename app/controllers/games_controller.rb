class GamesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @game = Game.new
  end

  def create

    @game = current_user.games.build(game_params)
    if @game.save
      redirect_to user_games_path(current_user)
    else
      render :new
    end
  end

  def index
    @games = current_user.games
  end

  def show
    @game = find_game
  end

  def edit
    @user = current_user
    @game = find_game
  end

  def update
    @game = find_game
    if @game.update(game_params)
      redirect_to user_game_path(@game)
    else
      render :edit
  end
end

  private

  def game_params
    params.require(:game).permit(:name, :game_type, :play_time, :main_setup, :score)
  end

  def find_game
      Game.find(params[:id])
    end

end

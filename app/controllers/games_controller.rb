class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to user_games_path(@game)
    else
      render :new
    end
  end

  def index
    @games = current_user_games(current_user)
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to user_game_path(@game)
    else
      render :edit
  end
end

  private

  def game_params
    params.require(:game).permit(:name, :game_type, :play_time, :main_setup)
  end

end

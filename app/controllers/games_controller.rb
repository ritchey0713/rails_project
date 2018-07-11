class GamesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @game = Game.new
    @ranking = @game.rankings.build
  end

  def create
    @game = current_user.games.new(game_params)
      if @game.save
        @ranking = current_user.rankings.build(:game => @game )
        @ranking.save

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
    @rank= Ranking.find_by(game_id: find_game)
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

  def destroy
    @game = find_game
    @game.rankings.clear
    redirect_to user_games_path(current_user)
  end

  def scope
    if :score
      redirect_to scope
    else
      redirect_to user_games_path(current_user)
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :game_type, :play_time, :main_setup, :score, rankings_attributes: [:comment, :user_id])
  end

  def rank_comment
  end


  def find_game
      Game.find(params[:id])
    end
end

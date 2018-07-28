class GamesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @game = Game.new
    @ranking = @game.rankings.build
  end

  def create
    @user = current_user
    @game = current_user.games.new(game_params)
      if @game.save
        @ranking = current_user.rankings.build(:game => @game )
        @ranking.save
        respond_to do |f|
          f.json {render :json => @game}
          f.html {redirect_to user_path(@user)}

        end
      else
        render :new
      end
  end

  def index
    @games = current_user.games
    respond_to do |f|
      f.html {render :index}
      f.json {render :json => @games}
    end
  end

  def show
    @game = find_game
    #@rank= Ranking.find_by(game_id: find_game)
    respond_to do |f|
      f.html {render :show}
      f.json {render :json => @game}
    end
  end

  def edit
    @user = current_user
    @game = find_game
  end

  def update
    @game = find_game
      if @game.update(game_params)
        respond_to do |f|
          f.json {render :json => @game}
          f.html {redirect_to user_game_path(@game)}
        end

      else
        render :edit
      end
end

  def destroy
    @user = current_user
    @game = find_game
    @game.rankings.clear
    redirect_to user_game_path(@game)

  end

  def score
    if :score
      @score = Game.score
      render "/games/score"
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

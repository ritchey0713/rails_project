class RankingsController < ApplicationController

  def new #build out a new form with a new_score tag, i think thatll work..
    @ranking = Ranking.create(user_id: params[:user_id], game_id: params[:game_id])
    @message = @ranking.new_rank(new_score: params[:new_score])
    flash[:notice] = @message
    redirect_to #where should this go to????
end

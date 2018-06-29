class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def new_ranking(new_score)
    user = self.user
    game = self.game
      if game.score > new_score 
        game.score - new_score = total_score
        "Your new ranking is #{total_score}"
      elsif
         game.score < new_score
          new_score - game.score = total_score
          "Your new ranking is #{total_score}"
        else
          "Ranking has not changed!"
      end
    end


end

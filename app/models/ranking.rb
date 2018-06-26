class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :game
# class Task < ActiveRecord::Base
#   belongs_to :user
#   belongs_to :chore
#
#   scope :complete, -> { where(completion_status: 'complete') }
#
#   def self.last_completed
#     Task.complete.order('completion_date desc').first
#   end
# end


  def new_ranking(new_score)
  #where to build this new score
    user = self.user
    game = self.game
      if game.score > #something????
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

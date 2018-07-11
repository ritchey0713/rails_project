class AddCommentToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :comment, :string
  end
end

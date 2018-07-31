class MovePostsToPerson < ActiveRecord::Migration[5.1]
  def change
  	change_table :posts do |post|
  		post.references :person, index: true, foreign_key: true
  	end
  end
end

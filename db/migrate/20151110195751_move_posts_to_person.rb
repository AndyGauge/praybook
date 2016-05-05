class MovePostsToPerson < ActiveRecord::Migration
  def change
  	change_table :posts do |post|
  		post.references :person, index: true, foreign_key: true
  	end
  end
end

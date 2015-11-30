class MovePostsToPerson < ActiveRecord::Migration
  def change
  	change_table :posts do |post|
  		post.rename :user_id, :person_id
  	end
  end
end

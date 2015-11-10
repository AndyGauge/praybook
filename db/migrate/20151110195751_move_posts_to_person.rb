class MovePostsToPerson < ActiveRecord::Migration
  def change
  	change_column :posts, :user_id, :person_id
  end
end

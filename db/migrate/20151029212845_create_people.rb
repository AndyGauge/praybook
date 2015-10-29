class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :type

      t.timestamps null: false
    end
  end
end

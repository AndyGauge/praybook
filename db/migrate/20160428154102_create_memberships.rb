class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

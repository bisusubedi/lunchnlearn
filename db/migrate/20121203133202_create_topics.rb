class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :vote_count

      t.timestamps
    end
  end
end

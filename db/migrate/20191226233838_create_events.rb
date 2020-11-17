class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.string :name
      t.string :description
      t.datetime :time

      t.timestamps
    end
  end
end

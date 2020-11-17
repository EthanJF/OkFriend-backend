class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :age
      t.string :gender
      t.string :location
      t.integer :latitude
      t.integer :longitude
      t.string :looking_for
      t.string :picture
      t.string :about_me

      t.timestamps
    end
  end
end

class AddAboutMeColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about_me, :string
  end
end

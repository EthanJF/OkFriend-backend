class RenameColumnLocationInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :location, :city
  end
end

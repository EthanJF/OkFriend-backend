class ChangeCityColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :city, :zip_code
  end
end

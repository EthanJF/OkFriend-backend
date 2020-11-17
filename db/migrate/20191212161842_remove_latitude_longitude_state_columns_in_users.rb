class RemoveLatitudeLongitudeStateColumnsInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :latitude
    remove_column :users, :longitude
    remove_column :users, :state
  end
end

class ChangeDefaultValueOfPictureColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :picture, :string, :default => "https://icon-library.net/images/default-profile-icon/default-profile-icon-24.jpg"
  end
end

class AddDefaultPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: 'https://xsgames.co/randomusers/avatar.php?g=male'
  end
end

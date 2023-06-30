class AddDefaultBioToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :bio, :text, default: 'Enter your bio'
  end
end

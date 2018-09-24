class AddOmniauthColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :twi_name, :string
    add_column :users, :twi_img, :string
  end
end

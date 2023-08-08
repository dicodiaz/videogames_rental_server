class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :admin, :boolean, default: false
  end
end

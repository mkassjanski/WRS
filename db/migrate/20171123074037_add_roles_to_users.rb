class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean
    add_column :users, :master_game, :boolean
    add_column :users, :user_role, :boolean
  end
end

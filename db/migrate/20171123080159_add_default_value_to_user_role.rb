class AddDefaultValueToUserRole < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :user_role, :boolean, default: true
  end
  def down
  change_column :users, :user_role, :boolean, default: nil
  end
end

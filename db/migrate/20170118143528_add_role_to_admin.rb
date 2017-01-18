class AddRoleToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :role, :integer, null: false, default: 1
  end
end

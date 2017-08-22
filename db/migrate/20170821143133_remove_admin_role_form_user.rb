class RemoveAdminRoleFormUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin_role
  end
end

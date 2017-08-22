class AddUnameAndRoletoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :admin_role, :boolean, default: false
  end
end

class AddColumnToPermissionRole < ActiveRecord::Migration
  def change
    add_column :permission_roles, :permission_id, :integer
    add_column :permission_roles, :role_id, :integer
  end
end

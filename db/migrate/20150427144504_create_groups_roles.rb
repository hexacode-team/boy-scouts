class CreateGroupsRoles < ActiveRecord::Migration
  def change
    create_table :groups_roles do |t|
      t.integer :group_id
      t.integer :role_id
    end
  end
end
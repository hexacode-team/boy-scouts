class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :cell_phone
      t.string :landline
      t.string :email
      t.boolean :is_active
      t.string :vehicle
      t.integer :group_id
      t.integer :route_id

      t.timestamps null: false
    end
  end
end

class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell_phone
      t.string :landline
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps null: false
    end
  end
end

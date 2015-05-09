class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :subscription_id
      t.decimal :amount_paid
      t.datetime :date
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :paypal
      t.text    :notes
      t.timestamps null: false
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer, :run_id
      t.intger, :subscription_id
      t.datetime, :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end

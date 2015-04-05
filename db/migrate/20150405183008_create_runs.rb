class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :route_id
      t.datetime :date
      t.integer :time_taken
      t.string :am_pm

      t.timestamps null: false
    end
  end
end

class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :route_id
      t.datetime :datetime_started
      t.datetime :datetime_ended
      t.string :am_pm
      t.timestamps null: false
    end
  end
end

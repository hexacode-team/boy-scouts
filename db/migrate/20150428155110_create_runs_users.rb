class CreateRunsUsers < ActiveRecord::Migration
  def change
    create_table :runs_users do |t|
      t.integer :run_id
      t.integer :user_id
    end
  end
end

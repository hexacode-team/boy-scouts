class CreateMembersRuns < ActiveRecord::Migration
  def change
    create_table :members_runs do |t|
      t.references :member, index: true, foreign_key: true
      t.references :run, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

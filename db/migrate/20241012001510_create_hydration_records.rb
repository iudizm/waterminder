class CreateHydrationRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :hydration_records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.datetime :recorded_at

      t.timestamps
    end
  end
end

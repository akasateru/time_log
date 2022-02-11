class CreateTimeRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :time_records do |t|
      t.text :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

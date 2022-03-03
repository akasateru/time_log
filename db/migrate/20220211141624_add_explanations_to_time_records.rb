class AddExplanationsToTimeRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :time_records, :explanation, :text
  end
end

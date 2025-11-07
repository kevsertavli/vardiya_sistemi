class CreateShifts < ActiveRecord::Migration[8.0]
  def change
    create_table :shifts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.date :date

      t.timestamps
    end
  end
end

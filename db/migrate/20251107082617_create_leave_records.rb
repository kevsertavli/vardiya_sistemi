class CreateLeaveRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :reason
      t.string :status

      t.timestamps
    end
  end
end

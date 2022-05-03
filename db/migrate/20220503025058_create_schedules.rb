class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :consulting_rooms, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.boolean :available

      t.timestamps
    end
  end
end

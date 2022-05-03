class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :schedules, null: false, foreign_key: true
      t.references :patients, null: false, foreign_key: true
      t.references :doctors, null: false, foreign_key: true
      t.integer :status
      t.text :observations

      t.timestamps
    end
  end
end

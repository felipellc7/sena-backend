class AddingDefaultValues < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, default: "admin"
    add_column :doctors, :role, :string, default: "doctor"
    add_column :patients, :role, :string, default: "patient"
    change_column :doctors, :active, :boolean, default: true
    change_column :patients, :active, :boolean, default: true
    change_column :users, :active, :boolean, default: true
    change_column :schedules, :available, :boolean, default: true
    change_column :appointments, :status, :integer, default: 0
  end
end

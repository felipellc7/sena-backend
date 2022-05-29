class AddCodeToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :code, :string
  end
end

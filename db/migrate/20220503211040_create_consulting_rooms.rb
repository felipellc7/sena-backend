class CreateConsultingRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :consulting_rooms do |t|
      t.string :name
      t.references :specialty, null: false, foreign_key: true
      t.string :loc_country
      t.string :loc_region
      t.string :loc_city
      t.string :loc_commune
      t.string :loc_address
      t.string :loc_description

      t.timestamps
    end
  end
end

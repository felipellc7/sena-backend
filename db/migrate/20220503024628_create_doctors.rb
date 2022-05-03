class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.references :specialties, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :dni
      t.integer :gender
      t.string :email
      t.string :password_digest
      t.string :phone
      t.boolean :active

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
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

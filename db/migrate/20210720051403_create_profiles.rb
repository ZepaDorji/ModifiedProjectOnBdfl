class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :cid
      t.integer :contact_number
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

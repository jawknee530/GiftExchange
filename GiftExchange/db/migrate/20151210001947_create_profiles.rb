class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :giftee
      t.integer :user_id
      t.references :exchange, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

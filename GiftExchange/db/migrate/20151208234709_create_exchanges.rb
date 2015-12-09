class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :descripton
      t.string :dealine
      t.string :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

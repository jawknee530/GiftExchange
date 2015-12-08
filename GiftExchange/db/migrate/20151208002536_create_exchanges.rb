class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :description
      t.string :deadline
      t.string :date

      t.timestamps null: false
    end
  end
end

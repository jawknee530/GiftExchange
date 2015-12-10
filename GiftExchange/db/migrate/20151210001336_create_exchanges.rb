class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :Description
      t.string :Deadline
      t.string :Date
      t.string :assign
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateBridges < ActiveRecord::Migration
  def change
    create_table :bridges do |t|
      t.integer :user_id
      t.integer :exchange_id

      t.timestamps null: false
    end
  end
end

class UsersExchanges < ActiveRecord::Migration
  def change
    create_table :users_exchanges, id: false do |t|
      t.integer :user_id
      t.integer :exchange_id
    end
  end
end

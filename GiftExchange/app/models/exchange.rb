class Exchange < ActiveRecord::Base
  has_and_belongs_to_many(:users,
                          :join_table => "UsersExchanges",
                          :foreign_key => "exchange_id",
                          :association_foreign_key => "user_id")
end

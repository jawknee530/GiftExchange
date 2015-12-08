class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many(:exchanges,
                          :join_table => "UsersExchanges",
                          :foreign_key => "user_id",
                          :association_foreign_key => "exchange_id")
end

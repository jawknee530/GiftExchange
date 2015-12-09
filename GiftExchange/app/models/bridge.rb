class Bridge < ActiveRecord::Base
  belongs_to :exchange
  belongs_to :users
end

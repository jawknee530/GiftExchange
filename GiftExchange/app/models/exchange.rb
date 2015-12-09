class Exchange < ActiveRecord::Base
  belongs_to :user
  has_many :bridges
end

class Exchange < ActiveRecord::Base
  belongs_to :user
  has_many :profiles
end

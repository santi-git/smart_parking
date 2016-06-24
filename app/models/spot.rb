class Spot < ActiveRecord::Base
  belongs_to :areas

  has_many :reservations
  has_many :users, through: :reservations
end
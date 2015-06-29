class Review < ActiveRecord::Base
  validates :rating, presence: true, inclusion: { in: 1..5}
  validates :description, presence: true


  belongs_to :restaurant
end

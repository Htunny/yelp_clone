class Review < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  validates :rating, inclusion: (1..5)
end

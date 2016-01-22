class Review < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  validates :rating, inclusion: (1..5)
  has_many :endorsements
end

class Restaurant < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100v100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true


  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end

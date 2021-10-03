class Herb < ApplicationRecord
  has_many :post_comments
  has_many :likes
  has_many :tag_relationships
  
  attachment :herb_image
  
  validates :herb_name, presence: true
  validates :department_name, presence: true
  validates :caption, presence: true
end

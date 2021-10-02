class Herb < ApplicationRecord
  has_many :post_comments
  has_many :likes
  has_many :tag_relationships
  
  attachment :herb_image
  
  varidates :herb_name, presence: true
  varidates :department_name, presence: true
  varidates :caption, presence: true
end

class Tag < ApplicationRecord
  has_many :tag_relationships
  
  validates :tag_name, presence: true
end

class Tag < ApplicationRecord
  has_many :tag_relationships
  
  varidates :tag_name, presence: true
end

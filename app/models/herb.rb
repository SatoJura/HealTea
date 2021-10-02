class Herb < ApplicationRecord
  attachment :herb_image
  
  varidates :herb_name, presence: true
  varidates :department_name, presence: true
  varidates :caption, presence: true
end

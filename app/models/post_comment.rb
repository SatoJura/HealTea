class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :herb
  
  varidates :comment, presence: true
end

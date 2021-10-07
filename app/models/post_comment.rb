class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :herb

  validates :comment, presence: true
end

class Herb < ApplicationRecord
  has_many :post_comments
  has_many :likes
  has_many :tag_relationships, dependent: :destroy
    has_many :tags, through: :tag_relationships

  attachment :herb_image

  validates :herb_name, uniqueness: true
  validates :department_name, presence: true
  validates :caption, presence: true

  def save_tags(saveherb_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - saveherb_tags
    new_tags = saveherb_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag
    end
  end
end

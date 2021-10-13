class Herb < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  attachment :herb_image

  validates :herb_image, presence: true
  validates :herb_name, presence: true,
                        uniqueness: true
  validates :department_name, presence: true
  validates :caption, presence: true

  def save_tags(saveherb_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - saveherb_tags
    new_tags = saveherb_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      tags << post_tag
    end
  end

  # likesテーブル内にuserが存在する==true/存在しない==false
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end

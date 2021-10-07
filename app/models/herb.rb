class Herb < ApplicationRecord
  has_many :post_comments
  has_many :likes
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  attachment :herb_image

  validates :herb_image, presence: true
  validates :herb_name, presence: true,
                        uniqueness: true
  validates :department_name, presence: true
  validates :caption, presence: true

  def save_tags(saveherb_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil? # もともと保存されているすべてのタグ
    old_tags = current_tags - saveherb_tags # 今回新たに保存したタグ以外の保存されたタグ
    new_tags = saveherb_tags - current_tags # 今回保存したタグから、もともと保存されていたタグを除いた、新規のタグ

    # 保存するherbにとって不要なタグを外す（deleteする）
    old_tags.each do |old_name|
      tags.delete Tag.find_by(tag_name: old_name)
    end

    # tagsにpost_tagを加える。（存在すればfind、新規ならcreateする）
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      tags << post_tag
    end
  end
end

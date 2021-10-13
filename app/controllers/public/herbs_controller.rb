class Public::HerbsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    # サイドの効能タグから絞り込み
    if params[:tag_id]
      @tag_relationship = TagRelationship.where(tag_id: params[:tag_id])
      @herbs = @tag_relationship.pluck(:herb_id).map { |x| Herb.find(x) } # 1つのタグに紐づくherb_id（複数）をmapで繰り返し処理し、取得
      @tag_list = Tag.all
    else
      @herbs = Herb.all
      @tag_list = Tag.all
    end
  end

  def show
    @herb = Herb.find(params[:id])
    @tag_list = Tag.all
    @post_comment = PostComment.new
    @post_comments = @herb.post_comments.all
  end
end

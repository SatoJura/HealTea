class Public::HerbsController < ApplicationController
  def index
      # サイドバーの効能タグから絞り込み
    if params[:tag_id]
      @tag_relationship = TagRelationship.where(tag_id: params[:tag_id]) # クリックした1つのタグに紐づく複数の情報を、中間テーブルから配列で取得
      @herbs = @tag_relationship.pluck(:herb_id).map{ |x| Herb.find(x) } # 1つのタグに紐づくherb_id（複数）をmapで繰り返し処理し、取得
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

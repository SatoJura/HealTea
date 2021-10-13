class Public::PostCommentsController < ApplicationController
  def create
    herb = Herb.find(params[:herb_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.herb_id = herb.id
    post_comment.save
    flash[:success] = "共有しました"
    redirect_to herb_path(herb)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to herb_path(params[:herb_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

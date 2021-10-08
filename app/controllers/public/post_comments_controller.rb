class Public::PostCommentsController < ApplicationController
  # def new
  #   @herb = Herb.find(params[:herb_id])
  #   @post_comment = current_user.post_comments.new
  # end

  def create
    herb = Herb.find(params[:herb_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    # binding.pry
    post_comment.herb_id = herb.id
    post_comment.save
    flash[:success] = "共有しました"
    redirect_to herb_path(herb)
  end

  def destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

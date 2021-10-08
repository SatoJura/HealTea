class Public::LikesController < ApplicationController
  def create
    herb = Herb.find(params[:herb_id])
    like = current_user.likes.new(herb_id: herb.id)
    like.save
    flash[:success] = "いいね！しました"
    redirect_to herb_path(herb.id)
  end

  def destroy
    herb = Herb.find(params[:herb_id])
    like = current_user.likes.find_by(herb_id: herb.id)
    like.destroy
    flash[:success] = "いいね！を取り消しました"
    redirect_to herb_path(herb.id)
  end
end

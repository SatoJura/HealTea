class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:success]="編集に成功しました"
      redirect_to admin_tags_path(@tag)
    else
      flash.now[:alert]="編集に失敗しました"
      render "edit"
    end
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end

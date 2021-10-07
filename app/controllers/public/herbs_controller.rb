class Public::HerbsController < ApplicationController
  def index
    @herbs = Herb.all
    @tag_list = Tag.all
  end

  def show
    @herb = Herb.find(params[:id])
    @tag_list = Tag.all
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @herbs = @tag.herbs
    end
  end
end

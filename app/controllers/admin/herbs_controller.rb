class Admin::HerbsController < ApplicationController
  def index
  end

  def new
    @herb = Herb.new
  end

  def create
    @herb = Herb.new(herb_params)
    # 送られてきたtag_nameをsplit(',')で区切って、tag_listメソッドに定義。
    tag_list = params[:herb][:tag_name].delete(" ").delete("　").split(",")
    if @herb.save
      # herbモデルにsave_tags()メソッドを定義している。保存された@herbに紐づけられたtagをsaveする。
      @herb.save_tags(tag_list)
      flash[:success] = '新規登録が成功しました'
      redirect_to admin_herb_path(@herb.id)
    else
      flash.now[:alert] = '新規登録に失敗しました'
      render 'new'
    end
  end

  def show
    @herb = Herb.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def herb_params
    params.require(:herb).permit(:herb_name, :herb_image, :department_name, :caption)
  end
end

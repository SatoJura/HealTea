class Admin::HerbsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @herbs = Herb.all
  end

  def new
    @herb = Herb.new
  end

  def create
    @herb = Herb.new(herb_params)
    # 送られてきたtag_nameをsplit(',')で区切って、tag_listメソッドに定義。
    tag_list = params[:herb][:tag_ids].delete(" ").delete("　").split(",")
    if tag_list.empty?
      flash.now[:alert] = '新規登録に失敗しました'
      @herb.errors.add(:tag, "を入力してください")
      render 'new'
      return
    end
    if @herb.save
      # Herbモデルにsave_tags()メソッドを定義。
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
    @herb = Herb.find(params[:id])
    @tag_list = @herb.tags.pluck(:tag_name).join(',')
  end

  def update
    @herb = Herb.find(params[:id])
    tag_list = params[:herb][:tag_ids].delete(" ").delete("　").split(",")
    if @herb.update(herb_params)
      @herb.save_tags(tag_list)
      flash[:success] = '編集が成功しました'
      redirect_to admin_herb_path(@herb.id)
    else
      flash.now[:alert] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @herb = Herb.find(params[:id])
    if @herb.destroy
      flash[:success] = '削除しました'
      redirect_to admin_herbs_path
    else
      flash.now[:alert] = '削除できませんでした'
      render 'show'
    end
  end

  private

  def herb_params
    params.require(:herb).permit(:herb_name, :herb_image, :department_name, :caption)
  end
end

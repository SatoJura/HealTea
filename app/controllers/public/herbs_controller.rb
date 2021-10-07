class Public::HerbsController < ApplicationController
  def index
  end

  def show
    @herb = Herb.find(params[:id])
  end
end

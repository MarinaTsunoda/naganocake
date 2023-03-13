class Admin::ItemsController < ApplicationController
  before_action :set_genres, only: [:new]
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_active)
  end
  def set_genres
    @genres=Genre.all.pluck(:name, :id)
  end
end

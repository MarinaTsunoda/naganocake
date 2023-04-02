class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items=Item.page(params[:page])
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    @item.save
    flash[:notice] = "商品の新規作成が完了しました"
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def update
    @item=Item.find(params[:id])
    @item.update(item_params)
    flash[:notice] = "商品情報の更新が完了しました"
    redirect_to admin_items_path
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
  end

end

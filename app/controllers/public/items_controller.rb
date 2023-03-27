class Public::ItemsController < ApplicationController
  def index
    @customer=current_customer
    if params[:genre_id].present?
      @items=Item.where(genre_id: params[:genre_id])
    else
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true)
    end
  end

  def show
    @item=Item.find(params[:id])
    @genres=Genre.all
    @customer=current_customer
    @cart_item=CartItem.new
  end
end

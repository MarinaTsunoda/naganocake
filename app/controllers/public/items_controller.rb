class Public::ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @customer=current_customer
    @genre.id=@item.genre_id
  end

  def show
    @item=Item.find(params[:id])
    @genres=Genre.all
    @customer=current_customer
  end
end

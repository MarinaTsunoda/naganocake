class Public::ItemsController < ApplicationController
  def index
    @customer=current_customer
    # @genre=@items.genre
    if params[:genre_id].present?
      @items=Item.where(genre_id: params[:genre_id])
      # @genre=@items.genre
    else
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true)
    end
  end

  def show
    @item=Item.find(params[:id])
    @genres=Genre.all
    @customer=current_customer
  end
end

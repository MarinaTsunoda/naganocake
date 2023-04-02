class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items=current_customer.cart_items.all
    @total= 0
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = "カート内商品の更新が完了しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カート内商品を全て削除しました"
    redirect_to cart_items_path
  end

  def create
    if @cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       @cart_item.amount += params[:cart_item][:amount].to_i
       @cart_item.save
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.customer_id=current_customer.id
      @cart_item.save
    end
    flash[:notice] = "カートに商品を追加しました"
    redirect_to cart_items_path
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end

class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirm
    if params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    elsif params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    end
    @cart_items=current_customer.cart_items.all
  end

  def complete
  end

  def create
    @order=Order.new(order_params)
    @order.save
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.unit_price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end
    binding.pry
    CartItem.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders=current_customer.orders.all
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total_amount, :order_status, :customer_id)
  end
end

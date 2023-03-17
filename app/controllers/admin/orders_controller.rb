class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=Order_detail(@order.id)
  end

 def index
   @orders=Order.page(params[:page])
 end
 
  def update
    @order=Order.find(params[:id])
    @order.update
  end
end

class Admin::OrderDetailsController < ApplicationController
  def update
    @order=Order.find(params[:id])
    @order_detail=@order.Order_detail.find(params[:id])
    @order_detail.update
  end
end

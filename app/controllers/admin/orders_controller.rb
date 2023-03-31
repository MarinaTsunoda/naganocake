class Admin::OrdersController < ApplicationController
  def show
    @sum = 0
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all
    @order_detail=OrderDetail.find(params[:id])
  end

  def index
    @orders=Order.page(params[:page])
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end

class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @sum = 0
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all
  end

  def index
    @orders=Order.page(params[:page])
  end

  def update
    @order=Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.order_status == "confirmed_the_payment"
    end
    flash[:notice] = "注文情報の更新が完了しました"
    redirect_to admin_order_path(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end

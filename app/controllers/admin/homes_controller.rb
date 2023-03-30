class Admin::HomesController < ApplicationController
  def top
    if params[:customer_id].present?
      @orders=Order.where(customer_id: params[:customer_id]).page(params[:page])
    else
      @orders=Order.all.page(params[:page])
    end
  end
end

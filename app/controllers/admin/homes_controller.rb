class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @sum = 0
    if params[:customer_id].present?
      @customer=Customer.find(params[:customer_id])
      @orders=Order.where(customer_id: params[:customer_id]).page(params[:page])
    else
      @orders=Order.all.page(params[:page])
    end
  end
end

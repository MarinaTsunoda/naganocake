class Admin::OrdersController < ApplicationController
  def show
  end

 def index
   @orders=Order.page(params[:page])
 end
 
  def update
  end
end

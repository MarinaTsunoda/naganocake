class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "顧客情報の更新が完了しました"
    redirect_to admin_customers_path
  end
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end

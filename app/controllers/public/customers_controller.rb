class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    flash[:notice] = "お客様情報の更新が完了しました"
    redirect_to customers_my_page_path
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted:true)
    reset_session
    redirect_to root_path, notice: '退会処理を実行いたしました'
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end

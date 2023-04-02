class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses=current_customer.addresses.all
    @address=Address.new
    @customer=current_customer
  end

  def edit
    @address=Address.find(params[:id])
  end

  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id
    @address.save
    flash[:notice] = "配送先の登録が完了しました"
    redirect_to addresses_path
  end

  def update
    @address=Address.find(params[:id])
    @address.update(address_params)
    flash[:notice] = "配送先の更新が完了しました"
    redirect_to addresses_path
  end

  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先情報を削除しました"
    redirect_to addresses_path
  end
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :customer_id)
  end
end

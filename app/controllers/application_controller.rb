class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q_for_item

  def set_q_for_item
  @q = Item.ransack(params[:q])
  end

 def after_sign_in_path_for(resource)
    case resource
    when Admin
      top_path
    when Customer
      customers_my_page_path
    end
 end

 def after_sign_out_path_for(resource)
    case resource
    when :admin   # ログアウト時はシンボルが返ってくる
      new_admin_session_path
    when :customer  # ログアウト時はシンボルが返ってくる
      root_path
    end
 end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end

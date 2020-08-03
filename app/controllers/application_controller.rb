class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_kana, :family_kana, :birthday])
    # パスワード系はdeviceのデフォルトで実装されているため上記メソッドでpermitに記述する必要なし。
  end
end

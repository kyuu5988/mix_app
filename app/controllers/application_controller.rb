class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  #devise userテーブルのカラム保存許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana, :birth, :gender_id, :nick_name, :color_id])
  end
end

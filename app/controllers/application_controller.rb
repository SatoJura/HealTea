class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_admin
      flash[:notice] = "管理者ログインに成功しました"
      admin_herbs_path
    else
      flash[:notice] = "会員ログインに成功しました"
      herbs_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      flash[:notice] = "会員ログアウトに成功しました"
      root_path
    else
      flash[:notice] = "管理者ログアウトに成功しました"
      new_admin_session_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end

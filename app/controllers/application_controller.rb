class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #para autenticar
  before_action :authenticate_user!
  #para saltar autenticacion
  #skip_before_action :authenticate_user!, :only => [:index]

  #app/controllers/application_controller.rb

  protect_from_forgery with: :exception
   
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  #agregue esto para que se logeen con nombre
  protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login,:password,:password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.superadmin_role?
      rails_admin.dashboard_path  
    elsif current_user.utp_role?
      dash_utp_path
    elsif current_user.teacher_role?
      levels_path
    end
  end
end

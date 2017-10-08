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
end

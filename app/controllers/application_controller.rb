class ApplicationController < ActionController::Base
    layout 'application'
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :user_type, :password)}
    end
    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = "Access denied."
      redirect_to @bug
    end 
end
  
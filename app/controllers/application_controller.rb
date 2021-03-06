class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

   before_action :configure_devise_permitted_parameters, if: :devise_controller?
   before_filter :set_search

   def set_search
     @q=Place.ransack(params[:q])
   end

   protected

   def configure_devise_permitted_parameters
     registration_params = [:username, :email, :password, :password_confirmation]

     if params[:action] == 'update'
       devise_parameter_sanitizer.for(:account_update) { 
         |u| u.permit(registration_params << :current_password)
       }
     elsif params[:action] == 'create'
       devise_parameter_sanitizer.for(:sign_up) { 
         |u| u.permit(registration_params) 
       }
     end
   end


 end

#   protect_from_forgery with: :exception

#   protected

#   def configure_permitted_parameters


#     devise_parameter_sanitizer.for(:sign_up) do |u|
#       u.permit(:username, :email, :password, :password_confirmation)
#     end
#     devise_parameter_sanitizer.for(:account_update) do |u|
#       u.permit(:username, :email, :password, :password_confirmation, :current_password)
#     end
#   end
# end



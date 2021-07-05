class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :avatar])
end

def after_sign_in_path_for(resource)
    user_profile_path(current_user)
end

before_action :set_search

def set_search
  @q = Room.ransack(params[:q])
  @search_room = @q.result(distinct: true)
end


end

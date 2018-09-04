class RegistrationsController < Devise::RegistrationsController
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# ↓これを追加↓
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
    end
# ↑ここまで↑

  #   Prevent CSRF attacks by raising an exception.
#   For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception

# ↓これを追加↓
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   def create
#     @user = User.new
#     @user = User.new(configure_permitted_params)
#     if @user.save
#       flash[:success] = "Welcome to the Sample App!"
#       redirect_to @user
#     else
#       render 'new'
#     end
#   end

#   protected

#     def configure_permitted_parameters
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
#     end
# ↑ここまで↑

  
  # before_action :sign_up_params, if: :devise_controller?

  # def after_sign_up_path_for(resource)
  #   user_path(resource)
  # end

  # private

  #   def sign_up_params
  #     params.permit(:name, :email, :password, :password_confirmation)
  #   end
end
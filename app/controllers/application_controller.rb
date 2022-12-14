class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  add_flash_types :info, :error, :warning

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  include Pundit::Authorization

  def all_users
    User.where.not id: current_user.id
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def set_variables
    @notifications = policy_scope(Notification).where(read: false)
  end

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if request.fullpath != "/users" &&
      request.fullpath != "/users/sign_in" &&
      request.fullpath != "/users/sign_up" &&
      request.fullpath != "/users/password" &&
      request.fullpath != "/users/sign_out" &&
      !request.xhr? && !current_user # don't store ajax calls
      session[:return_to] = request.fullpath
    end
    if current_user && session[:return_to]
      return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to return_to
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    resource.groups.any? ? group_lunches_path(resource.groups.last) : root_path
  end
end

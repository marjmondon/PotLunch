class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit::Authorization

  def all_users
    User.where.not id: current_user.id
  end

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    group_lunches_path(current_user.groups.last)
  end
end

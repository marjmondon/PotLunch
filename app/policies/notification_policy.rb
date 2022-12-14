class NotificationPolicy < ApplicationPolicy
  def index?
    true
  end

  def mark_as_read?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end
end

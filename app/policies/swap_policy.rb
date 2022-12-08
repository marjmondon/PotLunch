class SwapPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    true
  end

  def initiate_chat?
    create?
  end

  def chatroom?
    create?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end

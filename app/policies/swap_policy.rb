class SwapPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end

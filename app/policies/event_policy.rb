class EventPolicy < ApplicationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  def index?
  end

  def show?
  end

  def create?
    user.is_hr?
  end

  def update?
    user.is_hr?
  end

  def destroy?
    user.is_hr?
  end

end

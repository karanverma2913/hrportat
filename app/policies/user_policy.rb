class UserPolicy < ApplicationPolicy

  def index?
    user.is_hr?
  end

  def show?
    user.is_employee?
  end

  def create?
    user.is_hr?
  end

  def update?
    user.is_employee?
  end

  def destroy?
    user.is_hr?
  end

end

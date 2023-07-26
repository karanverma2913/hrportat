class HolidayPolicy < ApplicationPolicy

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

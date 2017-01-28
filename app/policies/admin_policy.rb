class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  def create?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def update?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      [:name, :email, :role, :password, :password_confirmation]
    else
      [:email, :password, :password_confirmation, :name]
    end
  end

  class Scope < Scope
    def resolve
      if user.full_access?
        scope.filter_full_access
      else
        scope.filter_restrited_access
      end
    end
  end
end

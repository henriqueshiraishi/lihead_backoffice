class MemberPolicy < ApplicationPolicy

  def destroy?
    user.full_access?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end

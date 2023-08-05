class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def assign_email?
    user.is_admin_for?(record)
  end

  def set_email?
    user.is_admin_for?(record)
  end
end

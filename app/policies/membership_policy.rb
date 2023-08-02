class MembershipPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user_is_admin?(record.league)
  end

  def create?
    user_is_admin?(record.league)
  end

  def edit?
    user_is_admin?(record.league)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end

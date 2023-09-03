class GamePolicy < ApplicationPolicy
  def new?
    user_is_admin?(record.league)
  end

  def create?
    league = record.league || record.season.league
    return false unless league
    user_is_admin?(league)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end

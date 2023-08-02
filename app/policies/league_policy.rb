# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def show?
    record.private_league? ? user_is_member?(record) : true
  end

  def edit?
    user_is_admin?(record)
  end

  def update?
    user_is_admin?(record)
  end

  def destroy?
    user_is_admin?(record)
  end
end

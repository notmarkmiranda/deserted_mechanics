# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def show?
    record.private_league? ? user_is_member? : true
  end

  def edit?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  private

  def user_is_member?
    record.users.include?(user)
  end

  def user_is_admin?
    record.users.admin.include?(user)
  end
end

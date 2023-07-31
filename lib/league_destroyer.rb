class LeagueDestroyer
  def initialize(league, user_id)
    @league = league
    @user_id = user_id
  end

  def destroy
    league.memberships.where.not(user_id: user_id).destroy_all
    league.destroy
  end

  def self.destroy(league, user_id)
    new(league, user_id).destroy
  end

  private

  attr_reader :league, :user_id
end

class LeagueCreator
  attr_reader :league, :membership, :errors

  def initialize(params, user)
    @params = params
    @user = user
    @league = nil
    @membership = nil
    @errors = []
  end

  def save
    @league = create_league
    @membership = create_membership if errors.empty?
    return true if errors.empty?
    false
  end

  private

  attr_reader :params, :user

  def create_league
    league = League.new(params)
    if league.save
      @league = league
    else
      league.errors.full_messages.each { |e| @errors << e }
    end
  end

  def create_membership
    membership = Membership.new(league: @league, user: @user, role: 1)
    if membership.save
      @membership = membership
    else
      membership.errors.full_messages.each { |e| @errors << e }
    end
  end
end

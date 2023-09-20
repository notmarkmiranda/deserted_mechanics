class GamesController < ApplicationController
  before_action :load_league, except: [:show]

  def show
    @game = Game.find(params[:id])
    # authorize @game
  end

  def new
    @game = @league.games.new
    authorize @game
  end

  def create
    @game = initialize_game
    authorize @game
    if @game.save
      flash[:notice] = "Game scheduled"
      redirect_to game_path(@game)
    else
      @game.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def initialize_game
    if active_season?
      season = @league.active_season
      season.games.new(game_params)
    else
      @league.games.new(game_params)
    end
  end

  def game_params
    params.require(:game).permit(:date, :completed, :buy_in, :location, :estimated_player_count, :payout_schedule)
  end

  def load_league
    @league = League.find(params[:league_id])
  end

  def active_season?
    params[:active_season] && params[:active_season] == "1"
  end
end

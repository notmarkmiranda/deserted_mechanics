class GamesController < ApplicationController
  before_action :load_league, except: [:show]

  def show
    @game = Game.find(params[:id])
    # authorize @game
  end

  def new
    @game = Game.new
    # authorize @game
  end

  def create
    @game = if params[:active_season] == "1"
      season = @league.active_season || @league.create_active_season
      season.games.new(game_params)
    else
      @league.games.new(game_params)
    end
    # authorize @game
    if @game.save
      flash[:notice] = "Game scheduled"
      redirect_to game_path(@game)
    else
      @game.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:date, :completed, :buy_in, :location, :estimated_player_count, :payout_schedule)
  end

  def load_league
    @league = League.find(params[:league_id])
  end
end

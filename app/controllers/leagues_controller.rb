require "./lib/league_creator"

class LeaguesController < ApplicationController
  def show
    @league = League.find(params[:id])
    authorize @league
  end

  def new
    @league = League.new
  end

  def create
    league_creator = LeagueCreator.new(league_params, current_user)
    if league_creator.save
      flash[:notice] = "League created!"
      redirect_to league_creator.league
    else
      flash[:alert] = @league.errors.full_messages
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
    authorize @league
  end

  def update
    @league = League.find(params[:id])
    authorize @league
    if @league.update(league_params)
      flash[:notice] = "League updated!"
      redirect_to @league
    else
      flash[:alert] = @league.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
  end

  private

  def league_params
    params.require(:league).permit(:name, :location, :private_league)
  end
end

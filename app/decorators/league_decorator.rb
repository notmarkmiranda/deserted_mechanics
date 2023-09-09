class LeagueDecorator < ApplicationDecorator
  delegate_all

  def next_scheduled_game
    next_game = object.next_game
    if next_game
      object.next_game.date.strftime("%A, %B %e, %Y at %l:%M %p") 
    else
      "No scheduled game"
    end
  end
end

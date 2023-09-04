class SeasonDecorator < ApplicationDecorator
  delegate_all

  def winner
    "Mark Miranda"
  end
  
  def start_date
    "January 5, 2023"
  end

  def end_date
    object.completed ? "September 1, 2023" : "Still in Progress"
  end
end
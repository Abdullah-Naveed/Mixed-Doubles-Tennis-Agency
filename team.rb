require_relative 'player.rb'

class Team

  attr_accessor :men, :satisfaction

  def initialize(men, women)

    @men = men
    @women = women
    @satisfaction = calculate_satisfaction

  end

  def calculate_satisfaction

    men_satisfaction, women_satisfaction, team_satisfaction = 0.0

    #calculating men's satisfaction
    if @women.proficiency < @men.min_desired_prof
      men_satisfaction = (@women.proficiency - @men.min_desired_prof)
    else
      men_satisfaction = 0.0
    end

    #calculating women's satisfaction
    if @men.proficiency < @women.min_desired_prof
      women_satisfaction = (@men.proficiency - @women.min_desired_prof)
    else
      women_satisfaction = 0.0
    end

    team_satisfaction = (men_satisfaction + women_satisfaction)/2

  end

  def to_s

    "(#{@women.name}, #{@men.name}) Satisfaction: #{@satisfaction}"

  end



end
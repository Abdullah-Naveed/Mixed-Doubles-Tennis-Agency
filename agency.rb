require_relative 'player.rb'
require_relative 'steepest_ascent_algorithm.rb'
require_relative 'team.rb'

class Agency

  include Steepest_ascent_algorithm

  def initialize

    @men = []
    @women = []
    @teams = []

  end

  def add_men_players(men)

    @men.push(men)

  end

  def add_women_players(women)

    @women.push(women)

  end

  #iterator to iterate through men and women, finding the person with proficiency >= 9
  def each_player

    current_index = 0
    while current_index < @men.size

      if @men[current_index].proficiency >= 9
        yield @men[current_index]
      elsif @women[current_index].proficiency >= 9
        yield @women[current_index]
      end
      current_index += 1

    end

  end

  def max_value(tms)

    team_fitness=0.0
    tms.each do |team_satisfactions|
      team_fitness += team_satisfactions.calculate_satisfaction
      team_satisfactions.satisfaction=team_satisfactions.calculate_satisfaction #changing each teams satisfaction
    end
    team_fitness

  end

  def swap_elements_in_array(team, c1, c2)
    team[c1].men, team[c2].men = team[c2].men, team[c1].men
  end

  def steepest_ascent_hill_climb
    optimise(@teams)
  end

  def create_teams

    #sorting both men and women arrays by proficiency
    sorted_men = @men.sort{|t1, t2| t2.proficiency <=> t1.proficiency}
    sorted_women = @women.sort{|t1, t2| t2.proficiency <=> t1.proficiency}

    #pairs first element in the mens array, with the first element in the womens array.. and so on..
    sorted_men.zip(sorted_women).each do |pair|
      @teams.push(Team.new(pair[0], pair[1]))
    end

    @teams

  end

  def team_to_s

    str = ""
    @teams.each do |team|

      str += team.to_s + "\n"

    end

    str

  end

  def to_s

    str = "MALE Players \n"
    @men.each do |men|

      str += men.to_s + "\n"

    end

    str += "\nFEMALE Players \n"
    @women.each do |women|

      str += women.to_s + "\n"

    end

    str

  end

  private :swap_elements_in_array

end
require 'test/unit'
require_relative '../team'

class Team_Test < Test::Unit::TestCase

  def setup

    @teams_arr = [Team.new(Player.new('Abdullah',2,5), Player.new('Tiffany',5,4)),Team.new(Player.new('James',4,3), Player.new('Alice',7,5))]

  end

  def test_calculate_satisfaction

    team1_sat_original = @teams_arr[0].calculate_satisfaction

    @teams_arr[0].men, @teams_arr[1].men = @teams_arr[1].men, @teams_arr[0].men

    team1_sat_swapped = @teams_arr[0].calculate_satisfaction

    assert(team1_sat_original!=team1_sat_swapped, "calculate_satisfaction method not working.")

  end

end
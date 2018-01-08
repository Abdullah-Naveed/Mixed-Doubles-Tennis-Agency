require 'test/unit'
require_relative '../steepest_ascent_algorithm'
require_relative '../agency'

class Hill_Climb_Test < Test::Unit::TestCase

  def setup

    @agency=Agency.new

    @agency.add_men_players(Player.new('luke',6,5))
    @agency.add_men_players(Player.new('mike',5,7))
    @agency.add_men_players(Player.new('bob',2,1))
    @agency.add_men_players(Player.new('john',10,5))
    @agency.add_men_players(Player.new('sean',4,4))
    @agency.add_women_players(Player.new('michelle',8,8))
    @agency.add_women_players(Player.new('lucy',7,9))
    @agency.add_women_players(Player.new('patricia',10,4))
    @agency.add_women_players(Player.new('alice',6,3))
    @agency.add_women_players(Player.new('mary',5,5))

  end

  def test_optimise
    saved = @agency.create_teams
    max = @agency.max_value(saved)
    new_max_teams = @agency.optimise(saved)
    new_max = @agency.max_value(new_max_teams)
    assert(new_max>=max,'The optimise function gives back a less than optimal solution')

  end

end
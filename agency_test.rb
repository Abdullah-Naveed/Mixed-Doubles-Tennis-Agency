require 'test/unit'
require_relative '../agency'
require_relative '../team'

class Agency_Test < Test::Unit::TestCase

  def setup

    @agency_obj = Agency.new
    @agency_obj1 = Agency.new
    @team_obj = []

    @agency_obj.add_men_players(Player.new('luke',6,5))
    @agency_obj.add_men_players(Player.new('mike',5,7))
    @agency_obj.add_women_players(Player.new('michelle',8,8))
    @agency_obj.add_women_players(Player.new('lucy',7,9))

    @team_obj.push(Team.new(Player.new('Alex',6,5), Player.new('Patricia',4,2)))
    @team_obj.push(Team.new(Player.new('James',1,6), Player.new('Tiffany',2,4)))


  end

  def test_each_player

    @agency_obj.each_player {|player| assert(player.proficiency >= 9,  'Iterator not working.')}

  end

  def test_max_value

    satisfaction_1st = @agency_obj.max_value(@team_obj)

    @team_obj[0].men, @team_obj[1].men = @team_obj[1].men, @team_obj[0].men

    satisfaction_2nd = @agency_obj.max_value(@team_obj)

    assert(satisfaction_1st!=satisfaction_2nd, "max_value method not correct.")

  end

  def test_create_teams

    assert_equal([],@agency_obj1.create_teams,'No data to make teams, should be empty')

    @agency_obj1.add_men_players(Player.new('bob',2,1))
    @agency_obj1.add_men_players(Player.new('sean',4,4))
    @agency_obj1.add_women_players(Player.new('alice',6,3))
    @agency_obj1.add_women_players(Player.new('mary',5,5))

    assert_not_equal([],@agency_obj1.create_teams,'Data given, teams should have been made')


  end

end
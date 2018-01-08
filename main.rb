require_relative 'agency.rb'
require_relative 'player.rb'
require_relative 'team.rb'

class Main

  agency = Agency.new

  #reading in data from men.txt
  begin
    IO.foreach('men.txt') do |line|

      data = line.split
      name = data[0]
      proficiency = data[1].to_i
      min_desired_prof = data[2].to_i
      agency.add_men_players(Player.new(name, proficiency, min_desired_prof))
    end
  end rescue abort('error reading men.txt')

  #reading in data from women.txt
  begin
    IO.foreach('women.txt') do |line|
      data = line.split
      name = data[0]
      proficiency = data[1].to_i
      min_desired_prof = data[2].to_i
      agency.add_women_players(Player.new(name, proficiency, min_desired_prof))
    end
  end rescue abort('error reading women.txt')

  puts agency.to_s

  puts "\nTeam's:"
  agency.create_teams
  puts agency.team_to_s

  puts "\nElite Players:"
  agency.each_player {|x| puts x}

  puts "\nImproved set of Team's:"
  puts agency.steepest_ascent_hill_climb


end
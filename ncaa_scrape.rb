require 'nokogiri'
require 'open-uri'

class NCAABasketball
  attr_reader :division_one_data

  def initialize
    @rankings_page = Nokogiri::HTML(open("http://www.ncaa.com/rankings/basketball-men/d1/ncaa-mens-basketball-rpi"))
    @division_one_data = team_names.zip(team_conferences, team_records)
  end

  def team_names
    names = []
    @rankings_page.css('.ncaa-rankings-table > tbody > tr > td[3]').each { |row| names << row.content }
    names
  end

  def team_conferences
    conferences = []
    @rankings_page.css('.ncaa-rankings-table > tbody > tr > td[4]').each { |row| conferences << row.content }
    conferences
  end

  def team_records
    records = []
    @rankings_page.css('.ncaa-rankings-table > tbody > tr > td[5]').each { |row| records << row.content }
    records
  end

  def team_rankings
    rankings = Hash.new
    @division_one_data.each_with_index { |team, index| rankings[index+1] = team }
    rankings
  end

  def team_record(team_name)
    team = @division_one_data.select { |team| team.include?(team_name) }
    team.flatten.last
  end

  def team_wins(team_name)
    team_record(team_name).partition("-").first.to_i
  end

  def pick_five_total(*teams)
    teams.inject(0) do |total, team|
      total += team_wins(team)
    end
  end
end

scrape = NCAABasketball.new
#p scrape.pick_five_total("Texas", "Indiana", "North Carolina", "Georgetown", "Michigan St.")
p scrape.division_one_data
p scrape.team_names

require 'nokogiri'
require 'open-uri'

class NCAABasketballRankings
  attr_reader :division_one_data

  def initialize
    @rankings_page = Nokogiri::HTML(open("http://www.ncaa.com/rankings/basketball-men/d1"))
    @division_one_data = team_names.zip(team_divisions, team_records)
  end

  def team_names
    names = []
    @rankings_page.css('.ncaa-rankings-table > tbody > tr > td[3]').each { |row| names << row.content }
    names
  end

  def team_divisions
    divisions = []
    @rankings_page.css('.ncaa-rankings-table > tbody > tr > td[4]').each { |row| divisions << row.content }
    divisions
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
end

scrape = NCAABasketballRankings.new
puts scrape.team_rankings

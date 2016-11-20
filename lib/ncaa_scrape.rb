require 'nokogiri'
require 'open-uri'

class NCAABasketball
  attr_reader :division_one_data

  def initialize
    @rankings_page = Nokogiri::HTML(open('http://www.ncaa.com/standings/basketball-men/d1'))
    @division_one_data = team_names.zip(teams_wins)
  end

  def raw_data
    data = []
    @rankings_page.css(".even").each { |row| data << row.text }
    @rankings_page.css(".odd").each { |row| data << row.text }
    data.delete_if {|row| row.include?("WLPCT") }
  end

  def team_names
    names = []
    team_records.each { |row| names << row[0] }
    names
  end

  def teams_wins
    data = []
    @rankings_page.css(".even").each { |row| data << row.css('.conference-boundary').text }
    @rankings_page.css(".odd").each { |row| data << row.css('.conference-boundary').text }
    data.reject {|x| x == 'W'}
  end

  def team_records
    raw_data.map {|x| x.partition(/\d/) }
  end

  def team_wins(team_name)
    # if
    #   #teams_wins include team_name return
    # else
    #   0
    # end
  end

  def pick_five_total(*teams)
    teams.inject(0) do |total, team|
      total + team_wins(team)
    end
  end
end

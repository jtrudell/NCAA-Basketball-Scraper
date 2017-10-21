require 'nokogiri'
require 'open-uri'

class NCAABasketball
  attr_reader :standings_page, :division_one_data
  NCAA_RPI_URL = 'http://www.ncaa.com/rankings/basketball-men/d1/ncaa-mens-basketball-rpi'.freeze

  def initialize
    @standings_page = Nokogiri::HTML(open(NCAA_RPI_URL))
    @division_one_data = team_names.zip(wins).to_h
  end

  def team_names
    school_data.map { |row| row[2] }
  end

  def team_wins(team_name)
    division_one_data.include?(team_name) ? division_one_data[team_name] : 0
  end

  def pick_five_total(*teams)
    teams.inject(0) { |total, team| total + team_wins(team) }
  end

  private

  def rows
    # skip the first row, which is the table header
    standings_page.xpath('//tr')[1..-1]
  end

  def school_data
    rows.map { |row| row.children.map(&:text) }
  end

  def wins
    school_data.map { |row| row[4].split('-').first.to_i }
  end
end

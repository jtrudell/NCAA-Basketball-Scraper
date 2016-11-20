require 'nokogiri'
require 'open-uri'

class NCAABasketball
  attr_reader :division_one_data

  def initialize
    @standings_page = Nokogiri::HTML(open('http://www.ncaa.com/standings/basketball-men/d1'))
    @division_one_data = team_names.zip(wins).to_h
  end

  def team_names
    names = []
    raw_data.each { |row| names << row[0] }
    names
  end

  def team_wins(team_name)
    @division_one_data.include?(team_name) ? @division_one_data[team_name] : 0
  end

  def pick_five_total(*teams)
    teams.inject(0) { |total, team| total + team_wins(team) }
  end

  private

  def even_rows
    @standings_page.css('.even')
  end

  def odd_rows
    @standings_page.css('.odd')
  end

  def rows
    even_rows + odd_rows
  end

  def raw_data
    data = []
    rows.each { |row| data << row.text }
    data.delete_if { |row| row.include?('WLPCT') }
    data.map { |row| row.partition(/\d/) }
  end

  def wins
    data = []
    rows.each { |row| data << row.css('.conference-boundary').text }
    data.reject { |item| item == 'W' }
    data.map { |item| item.to_i}
  end

end

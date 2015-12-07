require 'nokogiri'
require 'open-uri'

divsion_one_rankings_page = Nokogiri::HTML(open("http://www.ncaa.com/rankings/basketball-men/d1"))

division_one_data_odd = []
division_one_data_even = []

divsion_one_rankings_page.css(".odd").each do |row|
  division_one_data_odd << row.text
end

divsion_one_rankings_page.css(".even").each do |row|
  division_one_data_even << row.text
end

division_one_data = division_one_data_odd.zip(division_one_data_even)

division_one_data.map! {|row| row[0] = row.first.split(",") }

big_ten = []

division_one_data.each do |school|
  if school.first.include?("Big Ten")
    big_ten << school
  end
end

p big_ten

def make_divisions(division_name)
  division = []
  if school.first.include?(division_name)
    division << school
  end
  division
end

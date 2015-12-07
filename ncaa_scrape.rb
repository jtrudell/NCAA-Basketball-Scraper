require 'nokogiri'
require 'open-uri'

divsion_one_rankings_page = Nokogiri::HTML(open("http://www.ncaa.com/rankings/basketball-men/d1"))

# empty arrays to hold odd and even row classes from NCAA rankings table
division_one_data_odd = []
division_one_data_even = []

divsion_one_rankings_page.css(".odd").each do |row|
  division_one_data_odd << row.text
end

divsion_one_rankings_page.css(".even").each do |row|
  division_one_data_even << row.text
end

# combine schools from odd and even rows, and split each row into one school
division_one_data = division_one_data_odd.zip(division_one_data_even)
division_one_data.map! {|row| row[0] = row.first.split(",") }


# big_ten = []
#
# division_one_data.each do |school|
#   if school.first.include?("Big Ten")
#     big_ten << school
#   end
# end
#
# p big_ten

#generate divisions from data by searching for name
def generate_division(division_name)
  division = []
  if school.first.include?(division_name)
    division << school
  end
  division
end

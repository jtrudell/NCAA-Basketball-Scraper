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

# combine schools from odd and even rows
@division_one_data = division_one_data_odd.zip(division_one_data_even)

# refactor: ugly method that deletes rankings from beginning of string and splits odd/even into separate arrays
def process_teams
  @division_one_data.map! do |row|
    row.map! do |inner|
      inner.split(",") if inner != nil
    end
  end
  @division_one_data.last.pop #gets rid of nil at end, find a better fix
  @division_one_data.flatten!.map! do |team|
    count = 0
    team.each_char do |char|
      if char.ord < 58 && count < 6
        team.gsub!(char, "")
        count += 1
      end
    end
  end
end

@processed_division_one_data = process_teams

def display_rankings
  @processed_division_one_data.each_with_index do |team, index|
    puts "Rank: #{index + 1} Team: #{team}"
  end
end

display_rankings

#generate divisions from data by searching for name
def generate_division(*division_names)
  division = []
  @processed_division_one_data.each do |school|
    division_names.each do |name|
      if school.include?(name)
        division << school
      end
    end
  end
  division
end

p generate_division("Big Ten", "BigTen")

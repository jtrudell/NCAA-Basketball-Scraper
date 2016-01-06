# NCAA-Basketball-Scraper
Scrapes 2015 NCCA Men's Basketball Division I teams/rankings/wins from http://www.ncaa.com/rankings/basketball-men/d1

# ncaa_scrape

As of January 2016, ncaa_scrape lets you scrape RPI rankings for Division I Men's college basketball from the NCAA website.
This gem uses nokogiri to scrape data from ncaa.com; if the NCAA website changes, this gem may fail.

## Installation

To install from the command line:

- gem install ncaa_scrape

This gem uses nokogiri. To install from the command line:

- gem install nokogiri

Once installed:

- require 'ncaa_scrape'

##Usage

NCAABasketball.new will scrape data from NCAA.com

Methods include division_one_data, team_names, team_conferences, team_records, team_rankings, team_record(team_name), team_wins(team_name), and pick_five_total(teams).

##Examples:

###All Scraped Data

- scrape = NCAABasketball.new
- scrape.division_one_data

Returns a nested array of team data, ordered by team rank (i.e., scrape.division_one_data[0] is the first ranked team).
For each individual team array, index 0 is the team name, index 1 is the conference, and index 2 is the record.

###All team names, team conferences, and all team records as arrays

- scrape.team_names
- scrape.team_conferences
- scrape.team_records

###Team rankings as a hash

- scrape.team_rankings

Returns a hash. Key is team rank, value is an array with the name, conference and record of the team.

###Individual team record or teams wins

- scrape.team_record("Michigan St.")
- scrape.team_wins("Michigan St.")

The first returns the team record (e.g. "1-0-2") as a string; the second returns wins only as an integer.
Note: team names must match those included in scrape.division_one_data exactly.

###Pick Five Total

- scrape.pick_five_total("Michigan St.", "Georgetown", "North Carolina", "Texas", "Indiana")

For use in your pick five basketball pool. Takes a list of team names and returns integer representing total wins for the 5 teams.

## Tests

Tests written in rspec.

- gem install rspec

From the spec folder:

- rspec ncaa_scrape_spec.rb

## Contributing

1. Fork it ( https://github.com/jtrudell/ncaa_scrape/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

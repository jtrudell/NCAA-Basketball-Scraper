# NCAA-Basketball-Scraper
Scrapes NCCA Men's Basketball Division I team names and wins from http://www.ncaa.com/rankings/basketball-men/d1/ncaa-mens-basketball-rpi

# ncaa_scrape

As of October 2017, ncaa_scrape lets you scrape team names and team wins from the NCAA RPI rankings page for Division I Men's college basketball.
This gem uses nokogiri to scrape data from ncaa.com; if the NCAA website changes, this gem may fail.

## Installation

To install from the command line:

- gem install ncaa_scrape

This gem uses nokogiri. To install from the command line:

- gem install nokogiri

Once installed:

- require 'ncaa_scrape'

## Usage

NCAABasketball.new will scrape data from NCAA.com.

Methods include division_one_data, team_names, team_wins(team_name), and pick_five_total(teams).

## Examples:

### All Scraped Data

- scrape = NCAABasketball.new
- scrape.division_one_data

Returns a hash of team data, with team name (string) as the key and wins (integer) as the value.

### All team names as an array

- scrape.team_names

### Individual teams wins

- scrape.team_wins("Michigan St.")

Returns wins as an integer.
Note: team names must match those included in scrape.division_one_data exactly.

### Pick Five Total

- scrape.pick_five_total("Michigan St.", "Georgetown", "North Carolina", "Texas", "Indiana")

For use in your pick five basketball pool. Takes a list of team names and returns integer representing total wins for the 5 teams.

## Tests

Tests written in rspec.

- gem install rspec

From the spec folder:

- rspec ncaa_scrape_spec.rb

## Contributing

1. Fork it ( https://github.com/jtrudell/NCAA-Basketball-Scraper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
  5. Create a new Pull Request

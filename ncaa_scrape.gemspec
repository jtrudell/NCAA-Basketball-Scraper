Gem::Specification.new do |s|
  s.name        = 'ncaa_scrape'
  s.version     = '0.1.0'
  s.date        = '2016-01-06'
  s.licenses    = ['MIT']
  s.summary     = "Scrapes NCAA Men's Div I Basketball RPI Rankings from NCAA.com"
  s.description = "As of January 2016, ncaa_scrape lets you scrape RPI rankings for Division I Men's college basketball from the NCAA website. This gem uses nokogiri to scrape data from ncaa.com; if the NCAA website changes, this gem may fail."
  s.authors     = ["Jen Trudell"]
  s.email       = 'jtrudell@gmail.com'
  s.files       = ["lib/ncaa_scrape.rb"]
  s.homepage    = 'https://rubygems.org/gems/ncaa_scrape'
end

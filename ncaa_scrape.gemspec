Gem::Specification.new do |s|
  s.name        = 'ncaa_scrape'
  s.version     = '0.2.0'
  s.date        = '2016-11-20'
  s.licenses    = ['MIT']
  s.summary     = "Scrapes NCAA Men's Div I Basketball STandings from NCAA.com"
  s.description = "As of November 2016, ncaa_scrape lets you scrape team names and team wins for Division I Men's college basketball from the NCAA website. This gem uses nokogiri to scrape data from ncaa.com; if the NCAA website changes, this gem may fail. For more information, see readme at https://github.com/jtrudell/NCAA-Basketball-Scraper"
  s.authors     = ["Jen Trudell"]
  s.email       = 'jtrudell@gmail.com'
  s.files       = ["lib/ncaa_scrape.rb"]
  s.homepage    = 'https://github.com/jtrudell/NCAA-Basketball-Scraper'
end

require 'ncaa_scrape'

RSpec.describe NCAABasketball do

  before(:each) do
    @scrape = NCAABasketball.new
  end

  describe 'attributes' do
    it 'is initialized with data from NCAA.com' do
      expect(NCAABasketball.new.instance_variable_get('@division_one_data')).to be_a Array
      expect(NCAABasketball.new.instance_variable_get('@division_one_data')).not_to be_empty
    end
  end

  describe '#team_names' do
    it 'returns an array of team names' do
      all_team_names = @scrape.team_names
      expect(all_team_names).to be_a Array
      expect(all_team_names).not_to be_empty
      expect(all_team_names.last).to be_a String
    end
  end

  describe '#team_conferences' do
    it 'returns an array of team conferences' do
      all_team_conferences = @scrape.team_conferences
      expect(all_team_conferences).to be_a Array
      expect(all_team_conferences).not_to be_empty
      expect(all_team_conferences.last).to be_a String
    end
  end

  describe '#team_records' do
    it 'returns an array of team records' do
      all_team_records = @scrape.team_records
      expect(all_team_records).to be_a Array
      expect(all_team_records).not_to be_empty
      expect(all_team_records.last).to be_a String
    end
  end

  describe '#team_rankings' do
    it 'returns a hash of team rankings' do
      all_team_records = @scrape.team_rankings
      expect(all_team_records).to be_a Hash
      expect(all_team_records).not_to be_empty
      expect(all_team_records[1]).to be_a Array
    end
  end

  describe '#team_record' do
    it "returns a string with a team's record" do
      team = @scrape.team_record("Texas")
      expect(team).to be_a String
    end
  end

  describe '#team_wins' do
    it "returns an integer with a team's wins" do
      team = @scrape.team_wins("Texas")
      expect(team).to be_a Integer
    end
  end

  describe '#pick_five_total' do
    it "returns an integer when given the names of five teams" do
      pick_five = @scrape.pick_five_total("Texas", "North Carolina", "Georgetown", "Indiana", "Michigan St.")
      expect(pick_five).to be_a Integer
    end
  end
end

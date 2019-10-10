require_relative '../lib/scraper.rb'

describe "the scraper method" do
  it "should return not nil" do
    expect(scraper).not_to be_nil
  end

  it "should be an array" do
  	expect(scraper.class).to eq(Array)
  end

  it "should displays more than 2000 hashes" do
  	expect(scraper.length > 2000).to eq(true)
  end
end
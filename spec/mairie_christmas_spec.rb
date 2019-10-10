require_relative '../lib/mairie_christmas.rb'

describe "the get townhall email method" do
  it "should return not nil" do
    expect(get_townhall_email('https://www.annuaire-des-mairies.com/95/groslay.html')).not_to be_nil
  end
end

describe "the get townhall name method" do
  it "should return not nil" do
    expect(get_townhall_email('https://www.annuaire-des-mairies.com/95/groslay.html')).not_to be_nil
  end
end

describe "the get townhall urls method" do
  it "should displays more than 100 urls" do
    expect(get_townhall_urls('https://www.annuaire-des-mairies.com/val-d-oise.html').length > 100).to eq(true)
  end
end

describe "the merge townhall infos method" do
  it "should be an array" do
  	expect(merge_townhall_infos('https://www.annuaire-des-mairies.com/val-d-oise.html').class).to eq(Array)
  end
 end

 describe "the perform method" do
  it "should be an array" do
  	expect(perform.class).to eq(Array)
  end
 end
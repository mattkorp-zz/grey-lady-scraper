require 'spec_helper'

describe "Scraper" do

  describe ".new" do
    it "initializes with a url" do
      expect(Scraper.new("http://www.hellophilco.com")).to be
    end
    it "errors without a url" do
      expect { Scraper.new }.to raise_error(ArgumentError)
    end
  end

  before(:each) { @scraper = Scraper.new("http://www.hellophilco.com")}

  describe "#get_hrefs" do
    it "returns an array" do
      expect(@scraper.get_hrefs).to be_instance_of Array
    end
    it "contains links from the page" do
      test_link = "test.html"
      expect(@scraper.get_hrefs).to include(test_link)
    end
    it "doesn't contain links not on the page" do
      test_link = "http://www.nytimes.com/pages/todayspaper/index.html"
      expect(@scraper.get_hrefs).to_not include(test_link)
    end
  end

  describe "#get_images" do
    it "returns an array" do
      expect(@scraper.get_images).to be_instance_of Array
    end
    it "contains images from the page" do
      test_img = "img/philco_anime.png"
      expect(@scraper.get_images).to include(test_img)
    end
    it "doesn't contain images not on the page" do
      test_img = "amoney_anime.png"
      expect(@scraper.get_images).to_not include(test_img)
    end
  end

end

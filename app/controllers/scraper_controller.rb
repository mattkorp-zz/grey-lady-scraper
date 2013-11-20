class ScraperController < ApplicationController

  def index
  end

  def get_images
    scraper = Scraper.new("http://www.nytimes.com")
    render json: scraper.get_images
  end

  def get_hrefs
    scraper = Scraper.new("http://www.nytimes.com")
    render json: scraper.get_hrefs
  end

end

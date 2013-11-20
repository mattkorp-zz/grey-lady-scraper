class Scraper

  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(HTTParty.get(@url))
  end

  def get_hrefs
    @doc.css('a').map { |link| link.get_attribute('href')}
  end

  def get_images
    @doc.css('img').map { |link| link.get_attribute('src')}
  end

end
class AmdDirectParser < BaseParser

  SOURCE = 'AMDirect'.freeze

  attr_accessor :page, :html

  def name
    page.at(".customer-details span#name").text
  end

  def email
    page.at(".customer-details span#email").text
  end

  def message
    strip_tags = ['span', 'label']
    fragment = page.at(".customer-details")
    fragment.css('br').each{ |br| br.replace "\n" }
    strip_tags.each { |tag| fragment.search(".//#{tag}").remove }
    fragment.text.strip
  end

  def source
    SOURCE
  end

  def make
    page.at(".vehicle-details span#make").text
  end

  def model
    page.at('//span[3]').text
  end

  def colour
    page.at(".vehicle-details span#colour").text
  end

  def year
    page.at(".vehicle-details span#year").text
  end

  def reference
    page.at(".vehicle-details span#listing-ref").text
  end

end

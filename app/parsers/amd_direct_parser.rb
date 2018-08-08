class AmdDirectParser

  SOURCE = 'AMDirect'.freeze

  attr_accessor :page, :html

  def initialize(page)
    @page = page
    @html = page.to_s
  end

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
end

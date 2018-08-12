class CarsForSaleParser < BaseParser

  SOURCE = 'CarsForSale'.freeze
  STRIP_TAGS = %w(h1 table)

  attr_accessor :page, :html

  def initialize(page)
    super
    @table = page.css('table')
  end

  def name
    clean_content
    fragment.text.split("(")[0].strip
  end

  def email
    clean_content
    fragment.text[/\(.*?\)/].gsub(/[()]/, "")
  end

  def message
    clean_content
    fragment.text.split('He asked:').last
      .remove('You can view the vehicle here').strip
  end

  def source
    SOURCE
  end

  def make
    table.css('tr[1] > td[2]').text
  end

  def model
    table.css('tr[2] > td[2]').text
  end

  def colour
    table.css('tr[4] > td[2]').text
  end

  def year
    table.css('tr[3] > td[2]').text
  end

  def reference
    nil
  end

  private

  attr_accessor :fragment, :table

  def clean_content
    @fragment = page.at("div")
    STRIP_TAGS.each { |tag| @fragment.search(".//#{tag}").remove }
  end
end

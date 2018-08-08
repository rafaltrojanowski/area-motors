class CarsForSaleParser < BaseParser

  SOURCE = 'CarsForSale'.freeze
  STRIP_TAGS = %w(h1 table)

  attr_accessor :page, :html

  def initialize(page)
    super
    clean_content
  end

  def name
    fragment.text.split("(")[0].strip
  end

  def email
    fragment.text[/\(.*?\)/].gsub(/[()]/, "")
  end

  def message
    fragment.text.split('He asked:').last
      .remove('You can view the vehicle here').strip
  end

  def source
    SOURCE
  end

  private

  attr_accessor :fragment

  def clean_content
    @fragment = page.at("div")
    STRIP_TAGS.each { |tag| @fragment.search(".//#{tag}").remove }
  end
end

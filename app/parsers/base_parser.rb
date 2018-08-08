class BaseParser

  def initialize(page)
    @page = page
    @html = page.to_s
  end

end

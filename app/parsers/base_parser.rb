class BaseParser

  def initialize(page)
    @page = page
    @html = page.to_s
  end

  def attributes
    {
      name: name,
      email: email,
      message: message,
      source: source,
      make: make,
      model: model,
      colour: colour,
      year: year,
      reference: reference,
    }
  end

end

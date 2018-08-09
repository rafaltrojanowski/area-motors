class EnquiryImporter

  attr_reader :enquiry_id

  def initialize(enquiry_id)
    @enquiry_id = enquiry_id
  end

  def perform
    return false unless enquiry.file.attached?
    parser = parser_klass.new(page)

    enquiry.update_attributes!(parser.attributes)
  end

  private

  def enquiry
    @enquiry ||= Enquiry.find(enquiry_id)
  end

  def page
    page ||= Nokogiri::HTML(open(enquiry.file_path))
  end

  def parser_klass
    {
      'carsforsale': 'CarsForSaleParser',
      'amdirect': 'AmdDirectParser'
    }[enquiry.website.to_sym].constantize
  end

end

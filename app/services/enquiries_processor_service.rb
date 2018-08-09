class EnquiriesProcessorService

  FILE_PATH      = Rails.root.join('public')
  FILE_EXTENSION = 'html'

  attr_reader :file_path

  def initialize(file_path = FILE_PATH)
    @file_path = file_path
  end

  def process
    Dir.glob("#{file_path}/*.#{FILE_EXTENSION}") do |path|
      if path.match? /amdirect|carsforsale/
        next if path.match('listing')

        ActiveRecord::Base.transaction do
          create_enquiry(path)
          parse_enquiry
        end
      end
    end
  end

  def create_enquiry(path)
    @enquiry = Enquiry.create_from!(path)
  end

  def parse_enquiry
    # TODO
    # EnquiryParserJob.perform_later(@enquiry.id)
  end
end

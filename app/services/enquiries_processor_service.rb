class EnquiriesProcessorService

  FILE_PATH      = Rails.root.join('public')
  IMPORT_PATH    = FILE_PATH.join('imported')
  FILE_EXTENSION = 'html'

  attr_reader :file_path, :import_path

  def initialize(file_path = FILE_PATH, import_path = IMPORT_PATH)
    @file_path     = file_path
    @import_path   = import_path
    @imported_ids  = []
  end

  def process
    Dir.glob("#{file_path}/*.#{FILE_EXTENSION}") do |path|
      if path.match? /amdirect|carsforsale/
        next if path.match('listing')

        @imported_ids << ActiveRecord::Base.transaction { create_enquiry(path) }

        parse_enquiry
        FileUtils.mv(path, import_path) # or alternatively delete file
      end
    end
  end

  def imported_ids
    @imported_ids.compact
  end

  def success?
    imported_ids.present?
  end

  def enquiries_count
    imported_ids.size
  end

  private

  def create_enquiry(path)
    @enquiry = Enquiry.create_from!(path)
  end

  def parse_enquiry
    EnquiryParserJob.perform_later(@enquiry.id)
  end
end

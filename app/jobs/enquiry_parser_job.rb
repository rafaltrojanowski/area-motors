class EnquiryParserJob < ApplicationJob
  queue_as :default

  def perform(enquiry_id)
    EnquiryImporter.new(enquiry_id).perform
  end
end

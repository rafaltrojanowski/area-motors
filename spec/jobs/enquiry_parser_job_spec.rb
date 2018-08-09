require 'rails_helper'

describe EnquiryParserJob, type: :job do
  let(:enquiry) { FactoryBot.build_stubbed(:enquiry) }
  subject(:job) { described_class.perform_now(enquiry.id) }

  it 'queues the job' do
    expect_any_instance_of(EnquiryImporter).to receive(:perform).once
    job
  end
end

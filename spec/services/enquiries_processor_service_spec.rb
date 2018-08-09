require 'rails_helper'

describe EnquiriesProcessorService do

  let(:subject) { described_class.new }

  describe "#process" do
    it 'stores enquiries in database' do
      expect { subject.process }.to change { Enquiry.count }.from(0).to(3)
    end

    it 'calls parser job' do
      expect(EnquiryParserJob).to receive(:perform_later).exactly(3).times
      subject.process
    end
  end
end

require 'rails_helper'

describe EnquiriesProcessorService do

  let(:file_path)   { Rails.root.join('spec/fixtures') }
  let(:import_path) { Rails.root.join('spec/fixtures/imported') }

  let(:subject) { described_class.new(file_path, import_path) }

  describe "#process" do
    before do
      expect(FileUtils).to receive('mv').exactly(3).times
    end

    it 'stores enquiries in database' do
      expect { subject.process }.to change { Enquiry.count }.from(0).to(3)
    end

    it 'returns success' do
      subject.process
      expect(subject.success?).to be_truthy
    end

    it 'returns enquiries_count' do
      subject.process
      expect(subject.enquiries_count).to eq(3)
    end

    it 'calls parser job' do
      expect(EnquiryParserJob).to receive(:perform_later).exactly(3).times
      subject.process
    end
  end
end

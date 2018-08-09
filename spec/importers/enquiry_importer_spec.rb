require 'rails_helper'

describe EnquiryImporter do

  let(:enquiry) { FactoryBot.create(:enquiry) }
  let(:subject) { described_class.new(enquiry.id) }

  describe "#perform" do
    before do
      subject.perform
      enquiry.reload
    end

    it 'updates name' do
      expect(enquiry.name).to eq("John Smith")
    end

    it 'updates email' do
      expect(enquiry.email).to eq("johnsmith@mailinator.com")
    end

    it 'updates message' do
      expect(enquiry.message).to eq("Do you take part exchange?What is the warranty like?")
    end

    it 'updates source' do
      expect(enquiry.source).to eq("CarsForSale")
    end
  end
end

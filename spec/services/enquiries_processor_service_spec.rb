require 'rails_helper'

describe EnquiriesProcessorService do

  let(:subject) { described_class.new }

  describe "#process" do
    it 'stores enquiries in database' do
      expect { subject.process }.to change { Enquiry.count }.from(0).to(3)
    end
  end
end

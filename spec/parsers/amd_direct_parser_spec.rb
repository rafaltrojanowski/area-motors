require 'rails_helper'

describe AmdDirectParser do

  let(:page) { Nokogiri::HTML(open("public/amdirect-1.html")) }
  let(:subject) { described_class.new(page) }

  describe "#name" do
    it 'returns name' do
      expect(subject.name).to eq("John Smith")
    end
  end

  describe "#email" do
    it 'returs email' do
      expect(subject.email).to eq("johnsmith@mailinator.com")
    end
  end

  describe "#message" do
    it 'returns message' do
      expected = """I'm interested in buying this car.
Would you take part exchange?
Thanks,

John"""
      expect(subject.message).to eq(expected)
    end
  end

  describe "#source" do
    it 'returns source' do
      expect(subject.source).to eq(AmdDirectParser::SOURCE)
    end
  end

  describe "#html" do
    it 'returns raw html' do
      expect(subject.html).to eq(
<<-_HTML_
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
  <body>
    <h1>AM-Direct Customer Enquiry</h1>
    <h2>Customer details:</h2>
    <div class="customer-details">
      <label>Name:&nbsp;</label><span id="name">John Smith</span><br>
      <label>Email:&nbsp;</label><span id="email">johnsmith@mailinator.com</span><br><br>
      <label>Enquiry:</label><br>
      I'm interested in buying this car.<br>Would you take part exchange?<br>Thanks,<br><br>John
    </div>
    <h2>Vehicle details:</h2>
    <div class="vehicle-details">
      <label>Listing Reference:&nbsp;</label><span id="listing-ref">AMD-FF1</span><br>
      <label>Make:&nbsp;</label><span id="make">Ford</span><br>
      <label>Model:&nbsp;</label><span id="make">Focus</span><br>
      <label>Colour:&nbsp;</label><span id="colour">blue</span><br>
      <label>Model:&nbsp;</label><span id="year">2008</span><br>
      <a href="/amdirect-1-listing.html">Click to view the listing</a>
    </div>
  <span><br><br>Sent from AM-Direct</span>
  </body>
</html>
_HTML_
      )
    end
  end
end

require 'rails_helper'

describe CarsForSaleParser do

  let(:page) { Nokogiri::HTML(open("public/carsforsale-1.html")) }
  let(:subject) { described_class.new(page) }

  describe "#name" do
    it 'returns name' do
      expect(subject.name).to eq("John Smith")
    end
  end

  describe "#email" do
    it 'returns email' do
      expect(subject.email).to eq("johnsmith@mailinator.com")
    end
  end

  describe "#message" do
    it 'returns message' do
      expect(subject.message).to eq("Do you take part exchange?What is the warranty like?")
    end
  end

  describe "#source" do
    it 'returns source' do
      expect(subject.source).to eq(CarsForSaleParser::SOURCE)
    end
  end

  describe "#html" do
    it 'returns raw html' do
      expect(subject.html).to eq(
<<-_HTML_
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
  <body>
    <div>
      <h1>CarsForSale</h1>
      John Smith (johnsmith@mailinator.com) has contacted you about a car for sale.<br>
      <table>
        <tr>
          <td>Make:</td>
          <td>Renault</td>
        </tr>
        <tr>
          <td>Model:</td>
          <td>Clio</td>
        </tr>
        <tr>
          <td>Year:</td>
          <td>2006</td>
        </tr>
        <tr>
          <td>Colour:</td>
          <td>White</td>
        </tr>
      </table>
      He asked: <br>
      Do you take part exchange?<br>What is the warranty like?<br><br>
      You can view the vehicle <a href="/carsforsale-1-listing.html">here</a>
    </div>
  </body>
</html>
_HTML_
      )
    end
  end
end

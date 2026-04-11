require_relative '../spec_helper'
require 'fixer/client'

RSpec.describe Fixer::Client do

  before do
    VCR.insert_cassette 'fixer'
  end

  after do
    VCR.eject_cassette
  end

  describe "#latest" do
    it "gets latest Fixer.io rates for PLN, USD, GBP for base EUR currecy" do
      stub_request(:any, "data.fixer.io") unless ENV["VCR_OFF"] == "1"
      fixer_client = Fixer::Client.latest
      result = fixer_client.fetch(["PLN", "USD", "GBP"])
      expect(result["success"]).to eql true
      expect(result["timestamp"]).to be > 0
      expect(result["rates"]).not_to eql nil
      expect(result["rates"]["PLN"]).to be > 1
      expect(result["rates"]["PLN"]).to be < 10
      expect(result["rates"]["USD"]).to be > 0
      expect(result["rates"]["USD"]).to be < 10
      expect(result["rates"]["GBP"]).to be > 0
      expect(result["rates"]["GBP"]).to be < 10
    end

	  it "fails to get Fixer.io rates for PLN, USD, GBP for base EUR currecy for specific date using #latest client" do
	    fixer_client = Fixer::Client.latest
	    expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], "2018-10-01")
      }.to raise_error(ArgumentError)
	  end
  end

  describe "#historical" do
    it "gets the historical Fixer.io rates for PLN, USD, GBP for base EUR currecy" do
      fixer_client = Fixer::Client.historical
      result = fixer_client.fetch(["PLN", "USD", "GBP"], "2018-10-01")
      expect(result["success"]).to eql true
      expect(result["timestamp"]).to be > 0
      expect(result["rates"]).not_to eql nil
      expect(result["rates"]["PLN"]).to be > 1
      expect(result["rates"]["PLN"]).to be < 10
      expect(result["rates"]["USD"]).to be > 0
      expect(result["rates"]["USD"]).to be < 10
      expect(result["rates"]["GBP"]).to be > 0
      expect(result["rates"]["GBP"]).to be < 10
    end

    it "fails to fetch the historical Fixer.io rates for PLN, USD, GBP for base EUR currecy when the date is not provided" do
      fixer_client = Fixer::Client.historical
      expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], nil)
      }.to raise_error(ArgumentError)

      expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], "")
      }.to raise_error(ArgumentError)

      expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], " ")
      }.to raise_error(ArgumentError)

    end


    it "fails to fetch the historical Fixer.io rates for PLN, USD, GBP for base EUR currecy when the date is in invalid format" do
      fixer_client = Fixer::Client.historical
      expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], "20181001")
      }.to raise_error(ArgumentError)

      expect {
        fixer_client.fetch(["PLN", "USD", "GBP"], "2018-10-01T21:00:01.000+00:00")
      }.to raise_error(ArgumentError)

    end
  end

end
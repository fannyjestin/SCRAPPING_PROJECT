require_relative '../lib/darktrader'

describe "Perform Class function" do
​	it "return an array" do
    expect(perform.class).to eq(Array)
    end
end
​
  describe "hash Class function" do
    it "return an array with mini-hash" do
      expect(perform[0].class).to eq(Hash)
    end
end 
​
  describe "Perform values" do
    it "return an array at least 2300 values" do
      expect(perform.size>2300).to eq(true)
    end
end 
​
  describe "Perform first value " do
		it "the 1st money is BTC" do
      expect(perform[0].keys[0]).to eq("BTC")
    end
  end
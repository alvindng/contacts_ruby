require("rspec")
require('phone')

describe('Phone') do
  describe('#initialize') do
    it "will add a phone contact" do
      test_phone = Phone.new({:area_code => "555", :number => "555-5555", :type => "home"})
      expect(test_phone.area_code()).to(eq('555'))
    end
  end
end

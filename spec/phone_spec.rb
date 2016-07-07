require("rspec")
require('phone')

describe('Phone') do
  before() do
    Phone.clear()
  end

  describe('#initialize') do
    it "will add a phone contact" do
      test_phone = Phone.new({:area_code => "555", :number => "555-5555", :type => "home"})
      expect(test_phone.area_code()).to(eq('555'))
    end
  end

  describe('#save') do
    it('saves a phone to @@phones class variable') do
      test_phone = Phone.new({:area_code => "555", :number => "555-5555", :type => "home"})
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe('.find') do
    it('finds a phone from @@phones class variable') do
      test_phone = Phone.new({:area_code => "555", :number => "555-5555", :type => "home"})
      test_phone.save()
      expect(Phone.find(1)).to(eq(test_phone))
    end
  end
end

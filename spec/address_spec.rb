require('rspec')
require('address')

describe('Address') do
  before() do
    Address.clear()
  end

  describe('#initialize') do
    it('creates the address information for a address') do
      test_address = Address.new({:street => '123 Fake St', :city => "Chicago", :state => "Georgia", :zip =>'90210', :type => "home"})
      expect(test_address.state()).to(eq("Georgia"))
    end
  end

  describe('#save') do
    it('saves a address to @@addresses class variable') do
      test_address = Address.new({:street => '123 Fake St', :city => "Chicago", :state => "Georgia", :zip =>'90210', :type => "home"})
      test_address.save()
      expect(Address.all()).to(eq([test_address]))
    end
  end

  describe('.find') do
    it('finds a address from @@addresses class variable') do
      test_address = Address.new({:street => '123 Fake St', :city => "Chicago", :state => "Georgia", :zip =>'90210', :type => "home"})
      test_address.save()
      expect(Address.find(1)).to(eq(test_address))
    end
  end
end

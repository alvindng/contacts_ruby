require('rspec')
require('address')

describe('Address') do
  describe('#initialize') do
    it('creates the address information for a contact') do
      test_address = Address.new({:street => '123 Fake St', :city => "Chicago", :state => "Georgia", :zip =>'90210', :type => "home"})
      expect(test_address.state()).to(eq("Georgia"))
    end
  end
end

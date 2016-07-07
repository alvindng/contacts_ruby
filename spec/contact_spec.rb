require('rspec')
require('contacts')

describe('Contact') do

  describe('#initialize') do
    it('creates a new contact') do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      expect(test_contact.first()).to(eq('tony'))
    end
  end
end

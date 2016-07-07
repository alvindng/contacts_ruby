require('rspec')
require('contacts')
require('address')
require('phone')
require('email')

describe('Contact') do
  before() do
    Contact.clear()
  end

  describe('#initialize') do
    it('creates a new contact') do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      expect(test_contact.first()).to(eq('tony'))
    end
  end

  describe('#save') do
    it('saves a contact to @@contacts class variable') do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.find') do
    it('saves a contact to @@contacts class variable') do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      test_contact.save()
      expect(Contact.find(1)).to(eq(test_contact))
    end
  end

  describe('#add_address') do
    it "saves address object into contact object" do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      test_address = Address.new({:street => '123 Fake St', :city => "Chicago", :state => "Georgia", :zip =>'90210', :type => "home"})
      test_contact.add_address(test_address)
      expect(test_contact.address()).to(eq([test_address]))
    end
  end

  describe('#add_phone') do
    it "saves address object into contact object" do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      test_phone = Phone.new({:area_code => "555", :number => "555-5555", :type => "home"})
      test_contact.add_phone(test_phone)
      expect(test_contact.phone()).to(eq([test_phone]))
    end
  end
  
  describe('#add_email') do
    it "saves address object into contact object" do
      test_contact = Contact.new({:first => "tony", :last => "fabz", :title => "boss", :company => "home"})
      test_email = Email.new({:email => 'tfab@mail.net', :type => "work"})
      test_contact.add_email(test_email)
      expect(test_contact.email()).to(eq([test_email]))
    end
  end
end

require('rspec')
require('email')

describe('Email') do
  describe('#initialize') do
    it "will add email contact information" do
      test_email = Email.new({:email => 'tfab@mail.net', :type => "work"})
      expect(test_email.type()).to(eq("work"))
    end
  end
end

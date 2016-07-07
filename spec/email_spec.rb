require('rspec')
require('email')

describe('Email') do
  before() do
    Email.clear()
  end
  
  describe('#initialize') do
    it "will add email contact information" do
      test_email = Email.new({:email => 'tfab@mail.net', :type => "work"})
      expect(test_email.type()).to(eq("work"))
    end
  end

    describe('#save') do
      it('saves a email to @@emails class variable') do
        test_email = Email.new({:email => 'tfab@mail.net', :type => "work"})
        test_email.save()
        expect(Email.all()).to(eq([test_email]))
      end
    end

    describe('.find') do
      it('finds a email from @@emails class variable') do
        test_email = Email.new({:email => 'tfab@mail.net', :type => "work"})
        test_email.save()
        expect(Email.find(1)).to(eq(test_email))
      end
    end
end

class Contact
  attr_reader(:first, :last, :title, :company,:address, :phone, :email, :id)

  @@contacts = []

  define_method(:initialize) do |attribute|
    @first = attribute.fetch(:first)
    @last = attribute.fetch(:last)
    @title = attribute.fetch(:title)
    @company = attribute.fetch(:company)
    @address = []
    @phone = []
    @email = []
    @id = @@contacts.length() + 1
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each do |contact|
      if contact.id() == id.to_i
        found_contact = contact
      end
    end
    found_contact
  end

  attributes = ['address', 'phone', 'email']
  attributes.each do |att|
    eval('define_method(:add_' + att + ') do |' + att +'|
      @' + att + '.push(' + att + ')
    end')
  end
end

class Email
  attr_reader(:email, :type, :id)

  @@emails = []

  define_method(:initialize) do |attribute|
    @email = attribute.fetch(:email)
    @type = attribute.fetch(:type)
    @id = @@emails.length + 1
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:clear) do
    @@emails = []
  end

  define_singleton_method(:find) do |id|
    found_email = nil
    @@emails.each do |email|
      if email.id() == id.to_i
        found_email = email
      end
    end
    found_email
  end
end

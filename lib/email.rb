class Email
  attr_reader(:email, :type)
  
  define_method(:initialize) do |attribute|
    @email = attribute.fetch(:email)
    @type = attribute.fetch(:type)
  end
end

class Contact
  attr_reader(:first, :last, :title, :company)

  define_method(:initialize) do |attribute|
    @first = attribute.fetch(:first)
    @last = attribute.fetch(:last)
    @title = attribute.fetch(:title)
    @company = attribute.fetch(:company)
  end
end

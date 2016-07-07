class Address
  attr_reader(:street, :city, :state, :zip, :type)

  define_method(:initialize) do |attribute|
    @street = attribute.fetch(:street)
    @city = attribute.fetch(:city)
    @state = attribute.fetch(:state)
    @zip = attribute.fetch(:zip)
    @type = attribute.fetch(:type)
  end
end

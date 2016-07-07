class Address
  attr_reader(:street, :city, :state, :zip, :type, :id)

  @@addresses = []

  define_method(:initialize) do |attribute|
    @street = attribute.fetch(:street)
    @city = attribute.fetch(:city)
    @state = attribute.fetch(:state)
    @zip = attribute.fetch(:zip)
    @type = attribute.fetch(:type)
    @id = @@addresses.length + 1
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:find) do |id|
    found_address = nil
    @@addresses.each do |address|
      if address.id() == id.to_i
        found_address = address
      end
    end
    found_address
  end
end

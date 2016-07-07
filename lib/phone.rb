class Phone
  attr_reader(:area_code, :number, :type, :id)

  @@phones = []

  define_method(:initialize) do |attribute|
    @area_code = attribute.fetch(:area_code)
    @number = attribute.fetch(:number)
    @type = attribute.fetch(:type)
    @id = @@phones.length + 1
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:clear) do
    @@phones = []
  end

  define_singleton_method(:find) do |id|
    found_phone = nil
    @@phones.each do |phone|
      if phone.id() == id.to_i
        found_phone = phone
      end
    end
    found_phone
  end
end

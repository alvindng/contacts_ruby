class Phone
  attr_reader(:area_code, :number, :type)
  define_method(:initialize) do |attribute|
    @area_code = attribute.fetch(:area_code)
    @number = attribute.fetch(:number)
    @type = attribute.fetch(:type)
  end
end

require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/address')
require('./lib/contacts')
require('./lib/email')
require('./lib/phone')

get('/') do
  erb(:index)
end

post('/contacts') do
  attribute = ['first', 'last', 'title', 'company']
  attribute.each do |att|
    eval('@' + att + ' = params.fetch("' + att + '")')
  end
  @contact = Contact.new({:first => @first, :last => @last, :title => @title, :company => @company})
  @contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

post('/contact/:id/address') do
  address_attribute = ['street', 'city', 'state', 'zip', 'atype']
  address_attribute.each do |att|
    eval('@' + att + ' = params.fetch("' + att + '")')
  end
  @address = Address.new({:street => @street, :city => @city, :state => @state, :zip => @zip, :type => @atype})
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_address(@address)
  erb(:contact)
end

post('/contact/:id/email') do
  email_attribute = ['mail', 'etype']
  email_attribute.each do |att|
    eval('@' + att + ' = params.fetch("' + att + '")')
  end
  @email = Email.new({:email => @mail, :type => @etype})
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_email(@email)
  erb(:contact)
end

post('/contact/:id/phone') do
  phone_attribute = ['area_code', 'number', 'ptype']
  phone_attribute.each do |att|
    eval('@' + att + ' = params.fetch("' + att + '")')
  end
  @phone = Phone.new({:area_code => @area_code, :number => @number, :type => @ptype})
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_phone(@phone)
  erb(:contact)
end



get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

info = ['address', 'email', 'phone']
info.each do |info|
  get('/contact/:id/' + info + '/new') do
    eval('@contact = Contact.find(params.fetch("id").to_i())
    erb(:' + info + '_form)')
  end
end

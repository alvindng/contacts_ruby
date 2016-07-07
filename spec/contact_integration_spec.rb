require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Address path', {:type => :feature}) do
  it('returns the contact entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"alvin")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    expect(page).to have_content('alvin')
  end
  it('returns the address entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"hello")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    click_link('hello ng')
    click_link('add_address')
    fill_in('street', :with => "123 Fake St")
    fill_in('city', :with => "Faketown")
    fill_in('state', :with => "Fakesville")
    fill_in('zip', :with => "90210")
    fill_in('atype', :with => "home")
    click_button('Add Address')
    expect(page).to have_content('123 Fake St')
  end
end

describe('Email path', {:type => :feature}) do
  it('returns the contact entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"alvin")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    expect(page).to have_content('alvin')
  end
  it('returns the email entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"gary")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    click_link('hello ng')
    click_link('add_email')
    fill_in('mail', :with => "dog@cat.com")
    fill_in('etype', :with => "Faketown")
    click_button('Add Email Address')
    expect(page).to have_content('dog@cat.com')
  end
end

describe('Phone path', {:type => :feature}) do
  it('returns the contact entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"alvin")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    expect(page).to have_content('alvin')
  end
  it('returns the phone entered by a user') do
    visit('/contacts/new')
    fill_in('first', :with =>"fart")
    fill_in('last', :with =>"ng")
    fill_in('title', :with =>"boss")
    fill_in('company', :with =>"UTI")
    click_button('Add Contact')
    click_link('hello ng')
    click_link('add_phone')
    fill_in('area_code', :with => "333")
    fill_in('number', :with => "4445555")
    fill_in('ptype', :with => "work")
    click_button('Add Phone Number')
    expect(page).to have_content('333')
  end
end

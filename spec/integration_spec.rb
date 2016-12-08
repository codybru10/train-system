require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new train', {:type => :feature}) do
  it('allows user to see the train list') do
    visit('/')
    click_link('Add New Train')
    expect(page).to have_content("Add a train to the database")
  end

  it('submits train to form') do
    visit('/trains')
    fill_in("name", :with => 'Max')
    click_button('Submit')
    expect(page).to have_content('Max')
  end
end

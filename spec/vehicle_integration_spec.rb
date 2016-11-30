
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('Triangle Typer', {:type => :feature}) do
  it('processes the user input and returns the appropriate type of triangle') do
    visit('/')
    fill_in('side_1', :with => 0)
    fill_in('side_2', :with => 0)
    fill_in('side_3', :with => 0)
    click_button('Send')
    expect(page).to have_content('equilateral triangle')
  end
end

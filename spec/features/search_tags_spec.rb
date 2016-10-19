require 'spec_helper'

feature 'Search by tags' do
  scenario 'shows tagged links only' do
    DatabaseCleaner.clean
    create_link
    click_button 'Add'
    link = Link.first
    fill_in :name, with: 'Kitten'
    click_button 'Search'
    expect(page).to have_content("Kitten Academy")
  end
end

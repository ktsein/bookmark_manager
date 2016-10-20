require 'spec_helper'

feature 'Search by tags' do
  scenario 'shows tagged links only' do
    DatabaseCleaner.clean
    create_link
    click_button 'Add'
    fill_in :search_tag, with: 'Kitten'
    click_button 'Search'
    expect(page).to have_content("Kitten Academy")
  end
end

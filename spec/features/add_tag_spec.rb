require 'spec_helper'

feature 'Adding tags to links' do
  scenario 'Assign tags to a link' do
    DatabaseCleaner.clean
    create_link
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Kitten')
  end

  scenario 'Assign multi-tags to a link' do
    DatabaseCleaner.clean
    visit '/links/new'
    fill_in :title, with: 'Kitten Academy'
    fill_in :url, with: 'http://www.kittenacademy.com'
    fill_in :tags, with: 'kitten animal'
    click_button 'Add'
    fill_in :search_tag, with: 'animal'
    expect(page).to have_content('kittenacademy')
  end

end

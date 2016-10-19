require 'spec_helper'

feature 'See links' do
  scenario 'When user visits the site' do
    DatabaseCleaner.clean
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Tag.first_or_create(name: 'Makers')
    visit '/links'
    find_link('makersacademy').visible?
  end
end

require 'spec_helper'

feature 'Adding tags to links' do
  scenario 'Assign tags to a link' do
    DatabaseCleaner.clean
    create_link
    expect(page).to have_content("Tags")
  end
end

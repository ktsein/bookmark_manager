require 'spec_helper'

feature 'Add users' do
  scenario 'when submitting the sign up form' do
    DatabaseCleaner.clean
    sign_up
    expect(current_path).to eq '/links'
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, kyaw@gmail.com')
  end
end

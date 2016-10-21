
def create_link
  visit '/links/new'
  fill_in :title, with: 'Kitten Academy'
  fill_in :url, with: 'http://www.kittenacademy.com'
  fill_in :tags, with: 'Kitten'
end

def sign_up
  visit '/'
  fill_in :email, with: 'kyaw@gmail.com'
  fill_in :password, with: '1234'
  click_button 'Sign up'
end

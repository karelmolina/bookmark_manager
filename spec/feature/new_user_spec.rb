
feature 'New user'do
  scenario 'sign up' do
    visit('/user/new')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'pwd', with: 'test'
    click_button 'sign up'

    expect(page).to have_content('Welcome, test@gmail.com')
  end
end

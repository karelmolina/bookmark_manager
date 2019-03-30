

feature '.Autheticate' do
  scenario 'authenticate the user' do
     User.generate(email: 'test7@gmail.com', pwd: 'test')

     visit('/sessions/new')
     fill_in 'email', with: 'test7@gmail.com'
     fill_in 'pwd', with: 'test'
     click_button 'sign in'

     expect(page).to have_content('Welcome, test7@gmail.com')
  end

  scenario 'the user dont exit' do
     User.generate(email: 'test8@gmail.com', pwd: 'test')

     visit('/sessions/new')
     fill_in 'email', with: 'notemail@gmail.com'
     fill_in 'pwd', with: 'test'
     click_button 'sign in'

     expect(page).to have_content('Username and/or Password are incorrect')
     expect(page).not_to have_content('Welcome, test8@gmail.com')
  end

  scenario 'the password is wrong' do
    User.generate(email: 'test9@gmail.com', pwd: 'test')
    visit('/sessions/new')
    fill_in 'email', with: 'test9@gmail.com'
    fill_in 'pwd', with: 'worng'
    click_button 'sign in'

    expect(page).to have_content('Username and/or Password are incorrect')
    expect(page).not_to have_content('Welcome, test9@gmail.com')
  end

  scenario 'user can sign out'do
      User.generate(email: 'test10@gmail.com', pwd: 'test')
      visit('/sessions/new')
      fill_in 'email', with: 'test10@gmail.com'
      fill_in 'pwd', with: 'test'
      click_button 'sign in'

      click_button 'sign out'
      expect(page).not_to have_content('Welcome, test10@gmail.com')
      expect(page).to have_content("You have sign out")
  end
end

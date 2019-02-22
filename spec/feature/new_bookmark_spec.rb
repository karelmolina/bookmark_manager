
feature 'Add a bookmark' do
  scenario '#new bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: 'http://facebook.com')
    fill_in('title', with: 'facebook')
    click_button('submit')
    expect(page).to have_content('http://facebook.com')
  end
end

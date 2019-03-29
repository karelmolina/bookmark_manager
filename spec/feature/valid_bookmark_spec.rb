
RSpec.feature 'bookmark is valid?' do
  scenario 'get the valid bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: 'Not url')
    fill_in('title', with: 'Not url')
    click_button('submit')

    expect(page).to have_content('You must submit a valid URL.')
    expect(page).not_to have_content('Not url')
  end
end

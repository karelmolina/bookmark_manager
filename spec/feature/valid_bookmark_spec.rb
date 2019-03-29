
RSpec.feature 'bookmark is valid?' do
  scenario 'get the valid bookmark' do
    visit '/bookmark/add'
    fill_in('url', with: 'Not url')
    fill_in('title', with: 'bookmark_test')

    expect(page).to have_content('You must submit a valid URL.')
    expect(page)-not_to have_content('Not url')
  end
end

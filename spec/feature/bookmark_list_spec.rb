
feature 'showing the list of bookmarks' do
  scenario '#bookmarks list' do
    visit('/bookmarks')

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end

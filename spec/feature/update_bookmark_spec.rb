
RSpec.feature 'UPDATE' do
  scenario 'edit the bookmark' do
    bookmark = Bookmark.generate(title:'edit', url: 'http://edit.com')
    visit('/bookmarks')
    expect(page).to have_link('edit',href: 'http://edit.com')

    first('.edit').click_button 'edit'
    # need "" to insert the variable
    expect(current_path).to eq "/bookmarks/edit/#{bookmark.id}"

  end
end

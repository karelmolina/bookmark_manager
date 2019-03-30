
feature 'Add new tag' do
  scenario 'get tag from user' do
    bookmark = Bookmark.generate(title: 'markers',url: 'http://www.makersacademy.com')
    visit('/bookmarks')

    page.find(".tag",match: :first).click_button 'add tag'
    #expect(current_path).to eq "/boomarks/#{bookmark.id}/tag/new"
    fill_in 'tag',with: 'Test tag'
    click_button 'submit'
    
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'Test tag'

  end
end

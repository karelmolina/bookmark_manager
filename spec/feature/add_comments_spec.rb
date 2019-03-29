require 'spec_helper'

feature 'Add a comment' do
  scenario 'register the comment' do
    bookmark = Bookmark.generate(title: 'github', url: 'http://github.com')
    visit('/boomarks')
    first('.comment').click_button 'add comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comment/new"

    fill_in 'comment', with: 'this is a comments '
    click_button 'submit'

    expect(current_path).to eq '/bookmarks'
  end
end

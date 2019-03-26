require 'spec_helper'

RSpec.feature 'Deleting a Bookmark' do
  scenario 'delete the bookmark' do

    bookmark = Bookmark.generate(title: 'justdelete', url: 'http://justdelete.com')

    visit('/bookmarks')
    expect(page).to have_link('justdelete',href: 'http://justdelete.com')
    first('.delete').click_button('delete')
    expect(current_path).to eq '/bookmarks'
    #usage: page.has_xpath('//a',:href => 'google.com')
    #page.has_xpath?('//bookmarks/') <- NOT
    expect(page).not_to have_content('justdelete')
  end
end

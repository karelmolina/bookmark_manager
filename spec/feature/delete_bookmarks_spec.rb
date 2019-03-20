require 'spec_helper'

RSpec.feature 'Deleting a Bookmark' do
  scenario 'delete the bookmark' do

    Bookmark.generate(title: 'justdelete', url: 'http://justdelete.com')

    visit('/bookmarks')
    expect(page).to have_link('justdelete',href: 'http://justdelete.com')
    first('.delete').click_button('delete')
    page.has_xpath?('/bookmarks')
    expect(page).should have_no_content('justdelete')
  end
end

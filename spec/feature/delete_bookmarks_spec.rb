require 'spec_helper'

RSpec.feature 'Deleting a Bookmark' do
  scenario 'delete the bookmark' do

    Bookmark.generate(title: 'justdelete', url: 'http://justdelete.com')

    visit('/bookmarks')

    expect(page).to have_link('justdelete',href: 'http://justdelete.com')
    click_button 'delete'
    expect(page).not_to have_link('justdelete', href: 'http://justdelete.com')
  end
end

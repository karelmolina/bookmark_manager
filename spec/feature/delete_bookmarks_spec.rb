require 'spec_helper'

RSpec.feature 'Deleting a Bookmark' do
  scenario 'delete the bookmark' do

    bookmark = Bookmark.generate(title: 'Academy', url: 'http://www.academy.com')

    visit('/bookmarks')
    expect(page).to have_link('Academy',href: 'http://www.academy.com')
    click_button("delete #{bookmark.id}")
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Academy', href: "http://www.academy.com")
  end
end

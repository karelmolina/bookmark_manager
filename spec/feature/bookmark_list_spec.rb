require 'pg'
require 'spec_helper'
feature 'showing the list of bookmarks' do
  scenario '#bookmarks list' do
    # Using bookmark.generate
    Bookmark.generate(title: 'markers',url: 'http://www.makersacademy.com')
    Bookmark.generate(title: 'google',url:'http://www.google.com')
    Bookmark.generate(title: 'destroyallsoftware',url:'http://www.destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_link('google',href: 'http://www.google.com')
    expect(page).to have_link('markers',href: 'http://www.makersacademy.com')
    expect(page).to have_link('destroyallsoftware',href: 'http://www.destroyallsoftware.com')

  end
end

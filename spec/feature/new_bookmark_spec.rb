  require 'spec_helper'
require 'pg'
RSpec.feature 'Add a bookmark' do
  scenario '#new bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: 'http://facebook.com')
    fill_in('title', with: 'facebook')
    click_button('submit')
    expect(page).to have_link('facebook', href: 'http://facebook.com')
  end
end

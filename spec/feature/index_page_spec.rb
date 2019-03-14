require 'spec_helper'
RSpec.feature 'acces to the page' do

  scenario 'loading index' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

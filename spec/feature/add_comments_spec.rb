require 'spec_helper'

RSpec.feature 'Add a comment' do
  scenario 'register the comment' do
    visit('/boomarks')
    page.find(".comment",match: :first).click_button 'add comment'
    #first("comment").click_button "add comment"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comment/new"

    fill_in 'comment', with: 'this is a comment test'
    click_button 'submit'
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content('this is a comment test')
  end
end

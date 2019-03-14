require 'bookmark'
require 'pg'
require 'database_helper'

describe Bookmark do

  describe '.all' do
    it 'returns a list with all bookmarks' do

      # Test Data
      bookmark = Bookmark.generate(title:'markers', url:'http://www.makersacademy.com')
      Bookmark.generate(title:'destroyallsoftware', url:'http://www.destroyallsoftware.com')
      Bookmark.generate(title: 'google', url:'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmark.first.id).to eq bookmark.first['id']
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
      expect(bookmarks.first.title).to eq('markers')
    end
  end

  describe '.new' do
    it 'create a new bookmark' do
      #test Data
      bookmark = Bookmark.generate(title:'facebook', url:'http://facebook.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark['id']).to eq(persisted_data)
      expect(bookmark['title']).to eq('facebook')
      expect(bookmark['url']).to eq 'http://facebook.com'

    end

  end
end

require 'bookmark'
require 'database_helper'

describe Bookmark do
  describe '.delete' do
    it 'delete a bookmark' do
      bookmark = Bookmark.generate(title: 'justdelete', url: 'http://www.justdelete.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
  describe '.all' do
    it 'returns a list with all bookmarks' do

      # Test Data
      bookmark = Bookmark.generate(title:'markers', url:'http://www.makersacademy.com')
      Bookmark.generate(title:'destroyallsoftware', url:'http://www.destroyallsoftware.com')
      Bookmark.generate(title: 'google', url:'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
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
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq('facebook')
      expect(bookmark.url).to eq 'http://facebook.com'

    end
  end

  describe '.update' do
    it 'edit the bookmark' do
      bookmark = Bookmark.generate(title: 'edit', url: 'http://www.edit.com')
      updated =  Bookmark.update(id: bookmark.id, title: 'Justedited', url: 'http://www.Justedited.com')

      expect(bookmark.id).to eq updated.id
      expect(bookmark.title).not_to eq updated.title
      expect(updated.url).to eq 'http://www.Justedited.com'
    end
  end
end

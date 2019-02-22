require 'bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns a list with all bookmarks' do
      # creating connection to db
      connection = PG.connect(dbname: 'bookmarks_manager_test')

      # Test Data
      connection.exec("INSERT INTO bookmark (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmark (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmark (url) VALUES('http://www.google.com');")


      bookmark = Bookmark.all

      expect(bookmark).to include('http://www.makersacademy.com')
      expect(bookmark).to include('http://www.destroyallsoftware.com')
      expect(bookmark).to include('http://www.google.com')
    end
  end
end

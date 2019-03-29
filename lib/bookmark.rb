require_relative 'ConnectionDatabase'
require 'uri'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      ConnectionDatabase.connect('bookmarks_manager_test')
      #@conection = PG.connect :dbname => 'bookmarks_manager_test'
    else
    ConnectionDatabase.connect('bookmarks_manager')
    #@conection = PG.connect :dbname => 'bookmarks_manager'
  end
    resultSet = ConnectionDatabase.query("SELECT * FROM bookmarks;")
    resultSet.map do |bookmark|
    Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  end
  end

  def self.generate(title:,url:)
    if ENV['ENVIROMENT'] == 'test'
      ConnectionDatabase.connect('bookmarks_manager_test')
      #@conection = PG.connect :dbname => 'bookmarks_manager_test'
    else
      ConnectionDatabase.connect('bookmarks_manager')
      #@conection = PG.connect :dbname => 'bookmarks_manager'
  end
    return false unless is_url?(url)
    resultSet = ConnectionDatabase.query("INSERT INTO bookmarks(title, url) VALUES('#{title}','#{url}') RETURNING id, title, url;")

    Bookmark.new(id: resultSet[0]['id'], title: resultSet[0]['title'], url: resultSet[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIROMENT'] == 'test'
      ConnectionDatabase.connect('bookmarks_manager_test')
      #@conection = PG.connect :dbname => 'bookmarks_manager_test'
    else
      ConnectionDatabase.connect('bookmarks_manager')
      #@conection = PG.connect :dbname => 'bookmarks_manager'
  end
    ConnectionDatabase.query("DELETE from bookmarks where id = #{id};")
  end

  def self.update(id:,title:,url:)
    if ENV['ENVIROMENT'] == 'test'
      ConnectionDatabase.connect('bookmarks_manager_test')
      #@conection = PG.connect :dbname => 'bookmarks_manager_test'
    else
      ConnectionDatabase.connect('bookmarks_manager')
      #@conection = PG.connect :dbname => 'bookmarks_manager'
  end
    resultSet = ConnectionDatabase.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}'
      WHERE id = #{id} RETURNING id, title, url;")
    Bookmark.new(id: resultSet[0]['id'], title: resultSet[0]['title'], url: resultSet[0]['url'])
  end

  private

  def self.is_url? (url)
    url =~ URI::regexp(['http','https'])
  end

end

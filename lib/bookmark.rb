require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
    @conection = PG.connect :dbname => 'bookmarks_manager_test'
  else
    @conection = PG.connect :dbname => 'bookmarks_manager'
  end
    resultSet = @conection.exec "SELECT * FROM bookmarks"
    resultSet.map do |bookmark|
    Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  end
  end

  def self.generate(title:,url:)
    if ENV['ENVIROMENT'] == 'test'
    conection = PG.connect :dbname => 'bookmarks_manager_test'
  else
    conection = PG.connect :dbname => 'bookmarks_manager'
  end
    resultSet = conection.exec "INSERT INTO bookmarks(title, url) VALUES('#{title}','#{url}') RETURNING id, title, url;"

    Bookmark.new(id: resultSet[0]['id'], title: resultSet[0]['title'], url: resultSet[0]['url'])
  end

end

require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIROMENT'] == 'test'
    @conection = PG.connect :dbname => 'bookmarks_manager', :user => 'karel'
  else
    @conection = PG.connect :dbname => 'bookmarks_manager_test', :user => 'karel'
  end
    resultSet = @conection.exec "SELECT * FROM bookmark"
    resultSet.map { |bookmark| bookmark['url']}
  end

  def self.new(url)
    if ENV['ENVIROMENT'] == 'test'
    @conection = PG.connect :dbname => 'bookmarks_manager', :user => 'karel'
  else
    @conection = PG.connect :dbname => 'bookmarks_manager_test', :user => 'karel'
  end
    resultSet = @conection.exec("INSERT INTO bookmark(url) VALUES('#{url}');")
  end

end

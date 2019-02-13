require 'pg'

class Bookmark


  def self.all
    if ENV['ENVIOREMNT'] == 'test'
    conection = PG.connect :dbname => 'bookmarks_manager', :user => 'karel'
  else
    conection = PG.connect :dbname => 'bookmarks_manager_test', :user => 'karel'
  end
    resultSet = conection.exec "SELECT * FROM bookmarks"
    resultSet.map { |bookmark| bookmark['url']}
  end

end

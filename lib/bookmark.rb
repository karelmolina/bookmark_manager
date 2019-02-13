require 'pg'

class Bookmark


  def self.all
    conection = PG.connect :dbname => 'bookmarks_manager', :user => 'karel'
    resultSet = conection.exec "SELECT * FROM bookmarks"
    resultSet.map { |bookmark| bookmark['url']}
  end

end

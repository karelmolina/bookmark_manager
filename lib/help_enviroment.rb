require_relative'ConnectionDatabase'

if ENV['ENVIROMENT'] == 'test'
  ConnectionDatabase.connect('bookmarks_manager_test')
  #@conection = PG.connect :dbname => 'bookmarks_manager_test'
else
  ConnectionDatabase.connect('bookmarks_manager')
  #@conection = PG.connect :dbname => 'bookmarks_manager'
end    

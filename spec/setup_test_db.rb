require 'pg'

p "Setting up test database.."

conection = PG.connect(dbname: 'bookmarks_manager_test')

conection.exec("TRUNCATE bookmark;")

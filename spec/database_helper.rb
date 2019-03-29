require_relative '../lib/ConnectionDatabase'

def persisted_data(id:, table:)
  ConnectionDatabase.connect(dbname: 'bookmarks_manager_test')
  ConnectionDatabase.query("SELECT * FROM #{table} WHERE id = #{id};")
  #result.first -> isn't necesary for this block
end

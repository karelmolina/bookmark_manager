require_relative '../lib/ConnectionDatabase'

def persisted_data(id:, table:)
  ConnectionDatabase.query("SELECT * FROM #{table} WHERE id = #{id};")
end

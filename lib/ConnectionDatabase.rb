require 'pg'

class ConnectionDatabase

  def self.connect(name_db)
    @connected = PG.connect(dbname: name_db)
  end

  def self.connection
    @connected
  end

  def self.query(sql)
    @connected.exec(sql)
  end
end

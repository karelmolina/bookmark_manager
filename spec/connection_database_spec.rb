#test the conection
require 'ConnectionDatabase'

describe ConnectionDatabase do
  describe '.conect' do
    it 'conect to database' do
      connection = ConnectionDatabase.connect('bookmarks_manager_test')
      expect(ConnectionDatabase.connection).to eq connection
    end
  end

  describe '.query' do
    it 'execute sql' do
      connection = ConnectionDatabase.connect('bookmarks_manager_test')
      expect(connection).to receive(:exec).with("select * from bookmarks;")
      ConnectionDatabase.query("select * from bookmarks;")
    end
  end
end

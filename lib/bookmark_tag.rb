require_relative 'ConnectionDatabase'

class Bookmark_Tag

  def self.generate(bookmark_id:, tag_id:)
    resultset = ConnectionDatabase.query("INSERT INTO bookmarks_tags(bookmark_id, tag_id) VALUES(#{bookmark_id},#{tag_id}) RETURNING id, bookmark_id, tag_id;")
    Bookmark_Tag.new(id: resultset[0]['id'],
                     bookmark_id: resultset[0]['bookmark_id'],
                     tag_id: resultset[0]['tag_id'])
  end

  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id:, bookmark_id:, tag_id:)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end

end

require_relative 'ConnectionDatabase'

class Tag

  def self.generate(tag:)
    resultset = ConnectionDatabase.query("INSERT INTO tags(tag) VALUES('#{tag}') RETURNING id,tag;")
    Tag.new(id: resultset[0]['id'],
            tag: resultset[0]['tag'])
  end

  def self.where(bookmark_id:)
    result = ConnectionDatabase.query("SELECT tags.id, tag FROM bookmarks_tags
                                        INNER JOIN tags ON tags.id = bookmarks_tags.tag_id
                                        WHERE bookmarks_tags.bookmark_id = #{bookmark_id};")
    result.map do |tag|
      Tag.new(id: tag['id'],
              tag: tag['tag'])
    end
  end

  attr_reader :id, :tag

  def initialize(id:, tag:)
    @id = id
    @tag = tag
  end

end

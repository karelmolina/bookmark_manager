require_relative 'ConnectionDatabase'
class Comments

  def self.generate(text:, bookmark_id:)
    resultSet = ConnectionDatabase.query("INSERT INTO comments (text,bookmark_id)
                                          VALUES(#{text},#{bookmark_id})
                                          RETURNING id, text, bookmark_id ;")
    Comments.new(
      id: resultSet[0]["id"],
      text: resultSet[0]["text"],
      bookmark_id: resultSet[0]["bookmark_id"]
    )
  end

  attr_reader :id, :text, :bookmark_id

  def initialize(id:, text:, bookmark_id: )
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end

require_relative 'ConnectionDatabase'
require_relative 'comments'
require_relative 'tags'
require 'uri'

class Bookmark
  def self.all
    resultSet = ConnectionDatabase.query("SELECT * FROM bookmarks;")
    resultSet.map do |bookmark|
    Bookmark.new(id: bookmark['id'],
                 title: bookmark['title'],
                 url: bookmark['url'])
    end
  end

  def self.generate(title:, url:)
    return false unless is_url?(url)
    resultSet = ConnectionDatabase.query("INSERT INTO bookmarks(title, url) VALUES('#{title}','#{url}') RETURNING id, title, url;")

    Bookmark.new(id: resultSet[0]['id'], title: resultSet[0]['title'], url: resultSet[0]['url'])
  end

  def self.delete(id:)
    ConnectionDatabase.query("DELETE from bookmarks where id = #{id};")
  end

  def self.update(id:,title:,url:)
    resultSet = ConnectionDatabase.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}'
      WHERE id = #{id} RETURNING id, title, url;")
    Bookmark.new(id: resultSet[0]['id'], title: resultSet[0]['title'], url: resultSet[0]['url'])
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def comments(comment_class = Comments)
    comment_class.where(bookmark_id: id)
  end

  def tags(tag_class = Tag)
    tag_class.where(bookmark_id: id)
  end

  private

  def self.is_url? (url)
    url =~ URI::regexp(['http','https'])
  end

end

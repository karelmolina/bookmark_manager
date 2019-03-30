require 'tags'
require 'database_helper'

describe Tag do
  describe 'generate'do
    it 'create a new tag' do
      tag = Tag.generate(tag: 'test tag')
      p_data = persisted_data(id: tag.id, table: 'tags')

      expect(tag).to be_a Tag
      expect(tag.id).to eq p_data.first['id']
      expect(tag.tag).to eq 'test tag'
    end
  end

  describe '.where' do
    it 'show tags for a bookmark id' do
      bookmark = Bookmark.generate(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag = Tag.generate(tag: 'test tag 1')
      Bookmark_Tag.generate(bookmark_id: bookmark.id, tag_id: tag.id)

      where = Tag.where(bookmark_id: bookmark.id)
      tagt = where.first
      expect(tagt).to be_a Tag
      expect(tagt.id).to eq tag.id
      expect(tagt.tag).to eq tag.tag
    end
  end
end

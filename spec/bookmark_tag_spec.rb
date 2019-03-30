require 'bookmark_tag'

describe Bookmark_Tag do
  describe 'generate' do
    it 'set a new bookmark_tag' do
      bookmark = Bookmark.generate(title: 'The tag', url: 'http://www.thetag.com')
      tag = Tag.generate(tag: 'test tag')

      bookmark_tag = Bookmark_Tag.generate(bookmark_id: bookmark.id, tag_id: tag.id)

      expect(bookmark_tag).to be_a Bookmark_Tag
      expect(bookmark_tag.tag_id).to eq tag.id
      expect(bookmark_tag.bookmark_id).to eq bookmark.id
    end
  end

end

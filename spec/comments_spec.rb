require 'comments'
require 'bookmark'
require 'database_helper'

describe Comments do
  describe '.generate' do
    it 'add a new comment' do
      bookmark = Bookmark.generate(title:'facebook', url:'http://facebook.com')
      comment = Comments.generate(text: 'this is a comments for facebook bookmark', bookmark_id: bookmark.id)

      p_data = persisted_data(id: comment.id, table: 'comments')
      expect(comment).to be_a Comments
      expect(comment.id).to eq p_data.first['id']
      expect(comment.text).to eq('this is a comments for facebook bookmark')
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end

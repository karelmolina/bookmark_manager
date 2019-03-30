require 'user'
require 'database_helper'

describe User do
  describe '.generate' do
    it 'create a new user' do
      user = User.generate(email: 'test@gmail.com', pwd: 'test')
      p_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq p_data.first['id']
      expect(user.email).to eq 'test@gmail.com'
    end
    it 'hash the password' do
      expect(BCrypt::Password).to receive(:create).with 'test'
      User.generate(email: 'test@gmail.com', pwd: 'test')
    end
  end

  describe '.find' do
    it 'find the user id' do
      user = User.generate(email: 'test@gmail.com', pwd: 'test  ')
      find = User.find(id: user.id)
      found = find.first
      expect(found.id).to eq user.id
      expect(found.email).to eq user.email
    end
  end
end

require 'user'
require 'database_helper'

describe User do
  describe '.generate' do
    it 'create a new user' do
      user = User.generate(email: 'test1@gmail.com', pwd: 'test')
      p_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq p_data.first['id']
      expect(user.email).to eq 'test1@gmail.com'
    end
    it 'hash the password' do
      expect(BCrypt::Password).to receive(:create).with 'test'
      User.generate(email: 'test2@gmail.com', pwd: 'test')
    end
  end

  describe '.find' do
    it 'find the user id' do
      user = User.generate(email: 'test3@gmail.com', pwd: 'test')
      found = User.find(id: user.id)
      #found = find.first
      expect(found.id).to eq user.id
      expect(found.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'check if the user exist' do
      user = User.generate(email: 'test4@gmail.com', pwd: 'test')
      auth = User.authenticate(email: 'test4@gmail.com', pwd: 'test')

      expect(auth.id).to eq user.id
    end
    it 'return nil user dont exit' do
      user = User.generate(email: 'test5@gmail.com', pwd: 'test')
      expect(User.authenticate(email: 'notemail@gmail.com', pwd: 'test')).to be_nil
    end
  end
end

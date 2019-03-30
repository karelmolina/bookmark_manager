require_relative 'ConnectionDatabase'
require 'bcrypt'

class User

  def self.generate(email:, pwd:)
    #plaintext to hash
    passw = BCrypt::Password.create(pwd)
    resultSet = ConnectionDatabase.query("INSERT INTO users(email,password) VALUES('#{email}','#{passw}') RETURNING id, email, password;")
    User.new(id: resultSet[0]['id'],
              email: resultSet[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    resultSet = ConnectionDatabase.query("SELECT * FROM users WHERE id = '#{id}';")
    resultSet.map do |find|
      User.new(id: find['id'], email: find['email'])
    end
    #User.new(id: resultSet[0]['id'], email: resultSet[0]['email '])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

end

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
    User.new(id: resultSet[0]['id'], email: resultSet[0]['email'])
  end

  def self.authenticate(email:, pwd:)
    res = ConnectionDatabase.query("SELECT * FROM users WHERE email = '#{email}';")
    return unless res.any?
    return unless BCrypt::Password.new(res[0]['password']) == pwd
    User.new(id: res[0]['id'], email: res[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

end

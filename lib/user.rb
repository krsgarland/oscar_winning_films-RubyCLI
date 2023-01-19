require "bcrypt"
require "pry"

class User 
    @@users = []
    attr_accessor :username, :password
    def initialize(username, password)
        @username = username
        @password = password
        @@users << self
    end

    def self.all 
        @@users
    end
end
require "bcrypt"
require "pry"

class User 
    @@users = []
    attr_accessor :username, :password

    def self.hash_password(password)
        BCrypt::Password.create(password)
    end

    def initialize(username, password)
        @username = username
        @password = User.hash_password(password)
        @@users << self
    end

    def self.all 
        @@users
    end

    def self.seed 
        users = [
            {
            username: "kristagarland",
            password: "password",
        },
        {
            username: "codefistudent",
            password: "password2"
        },
        ]

        users.each do |user|
            User.new(user[:username], user[:password])
        end
    end
end
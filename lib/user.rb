require "bcrypt"
require "pry"

class User 
    @@users = []
    attr_accessor :username, :password

    def initialize(username, password)
        @username = username
        @password = User.hash_password(password)
        @@users << self
    end

    def self.authenticate_user(username, password)
        authenticate_user = nil
        @@users.each do |user|
            if user.username == username && user.password == password
                authenticate_user = user
                break;
            end
        end
        authenticate_user
    end

    def self.hash_password(password)
        BCrypt::Password.create(password)
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
    
    def self.all 
        @@users
    end
end
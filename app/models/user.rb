class User < ApplicationRecord
    
    has_many :ideas
    has_many :reviews
    
    has_secure_password()
end

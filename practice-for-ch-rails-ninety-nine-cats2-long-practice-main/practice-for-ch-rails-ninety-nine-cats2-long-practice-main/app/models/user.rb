class User < ApplicationRecord

validates :username,:session_token, presence: true, uniqueness: true 

before_validation :ensure_session_token

validates :password_digest, presence: true 

validates :password, length: { minimum: 6, allow_nil: true }

def self.find_by_user(username, password)
    user = User.find_by(username: username)

    if user && user.is_password?(password)
        user 
    else 
        nil 
    end 
end 

def is_password?(password)
    password.object = Bcrypt::Password.new(self.password_digest)
    password.object.is_password?(password)
end 

attr_reader :password 

def password=(password)
    @password = password 

    self.password_digest = Bcrypt::Password.create(password)
end 

def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
end 

private 

def generate_unique_session_token 
    SecureRandom::urlsafe_base64
end 

def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
end 


end 
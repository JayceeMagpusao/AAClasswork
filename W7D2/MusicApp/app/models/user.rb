class User < ApplicationRecord
    attr_reader :password

    validates :session_token, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: true

    after_initialize :ensure_session_token

    def reset_session_token!
        self.session_token = Securerandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    private
    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
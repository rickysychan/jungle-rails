class User < ActiveRecord::Base
    has_secure_password

    has_many :reviews 

    after_create :send_registration_email

    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 2 }

    def self.authenticate_with_credentials(email, password)
        strippedEmail = email.strip
        emailToLowerCase = strippedEmail.downcase
        user = User.find_by_email(emailToLowerCase)
        if user && user.authenticate(password)
            user
        else 
            nil
        end
    end
    

    def send_registration_email
        UserMailer.welcome_email(self.id).deliver_later
    end
end

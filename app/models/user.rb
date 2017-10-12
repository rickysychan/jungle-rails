class User < ActiveRecord::Base
    has_secure_password

    after_create :send_registration_email

    private

    def send_registration_email
        UserMailer.welcome_email(self.id).deliver_later
    end
end

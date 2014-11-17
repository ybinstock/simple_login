class User < ActiveRecord::Base
  has_secure_password
  validates :username,
    presence: true,
    uniqueness: true
  validates_confirmation_of :password
	#attr_accessible :attribute1, attribute2
def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end
end

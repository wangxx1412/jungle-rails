class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end

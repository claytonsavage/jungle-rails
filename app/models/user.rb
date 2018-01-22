class User < ActiveRecord::Base

	 has_secure_password
	 
	 validates :first_name, presence: true
	 validates :last_name, presence: true
	 validates :email, presence: true
	 # validates :email, uniqueness: true
	 validates_uniqueness_of :email, :case_sensitive => false
	 validates :password, presence: true, length: { minimum: 8 }
	 validates :password_confirmation, presence: true
end
class User < ActiveRecord::Base

	 has_secure_password

	 before_save :downcase_fields


	 def self.authenticate_with_credentials(email, password)
	 	User.find_by(email: email.strip.downcase).try(:authenticate, password)
	 end

	 
	 validates :first_name, presence: true
	 validates :last_name, presence: true
	 validates :email, presence: true
	 validates_uniqueness_of :email, :case_sensitive => false
	 validates :password, presence: true, length: { minimum: 8 }
	 validates :password_confirmation, presence: true

	 def downcase_fields
	 	self.email.downcase!
	 end
end


 # def create
 #    user = User.find_by_email(params[:email])
 #    # If the user exists AND the password entered is correct.
 #    if user && user.authenticate(params[:password])
 #      # Save the user id inside the browser cookie. This is how we keep the user 
 #      # logged in when they navigate around our website.
 #      session[:user_id] = user.id
 #      redirect_to '/'
 #    else
 #    # If user's login doesn't work, send them back to the login form.
 #      redirect_to '/login'
 #    end
 #  end
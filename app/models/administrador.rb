class Administrador < ActiveRecord::Base
	def encrypt_password
		require 'digest/sha1'
  		if password.present?
    		self.password= Digest::SHA1.hexdigest(password)
  		end
	end

	def clear_password
  		self.password = nil
	end
	def match_password(login_password="")
  		password == Digest::SHA1.hexdigest(login_password)
	end
	def self.authenticate(username_or_email="", login_password="")
		user = Administrador.find_by_usuario(username_or_email)
	  	if user && user.match_password(login_password)
	    	return user
	  	else
	    	return false
	  	end
	end
end

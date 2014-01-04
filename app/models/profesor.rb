class Profesor < ActiveRecord::Base

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
    require 'digest/sha1'
      password == Digest::SHA1.hexdigest(login_password)
  end
  def self.authenticate(username="", login_password="")
      user = Profesor.find_by_rol(username)
      if user && user.match_password(login_password)
        return user
      else
        return false
      end
  end   
end

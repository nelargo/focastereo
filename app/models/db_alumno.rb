class Db_alumno < ActiveRecord::Base
	establish_connection "db_alumno_production"
	self.table_name = "datos_alumnos"
	
	def encrypt_password
		require 'digest/sha1'
  		if passwd.present?
    		self.passwd= Digest::SHA1.hexdigest(password)
  		end
	end

	def clear_password
  		self.passwd = nil
	end
	def match_password(login_password="")
		require 'digest/sha1'
  		passwd == Digest::SHA1.hexdigest(login_password)
	end
	def self.authenticate(username="", login_password="")
    	user = Dbalumno.find_by_login(username)
	  	if user && user.match_password(login_password)
	    	return user
	  	else
	    	return false
	  	end
	end
end

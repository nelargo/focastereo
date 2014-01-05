class Profesor < ActiveRecord::Base
    attr_accessible :nombre, :rol, :password, :oficina, :mail, :departamento
    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates :nombre, :presence => true, :length => { :in => 3..20 }
  # validates :mail, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :mail, :presence => true, :uniqueness => true
    validates :password, :confirmation => true 
    validates_length_of :password, :in => 6..20, :on => :create
    validates :departamento, :presence => true
    validates :oficina, :presence => true
    validates :rol, :presence => true, :uniqueness => true
    
    before_save :encrypt_password
    after_save :clear_password
	
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

require "digest/sha2"

class User < ActiveRecord::Base
  has_many :habrausers, :dependent => :nullify
  has_many :favs, :dependent => :nullify
  
  #
  # === validations ===
  
  validates :name, :presence => true, :uniqueness => true  
  
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  
  validate :password_must_be_present
  
  #
  # === class methods ===
  
  # authenticates user with given password
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  
  # encrypts pass with given salt.
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "molotok_loh" + salt)
  end
  
  #
  # === instance methods ===  
  
  # 'password' is a virtual attribute
  # stores plain-text password into instance variable and encrypts it 
  def password=(password)
    @password = password
    
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)      
    end
  end
  
  private
  
    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
  
end

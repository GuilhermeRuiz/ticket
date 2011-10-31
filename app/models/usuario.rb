require 'digest'

class Usuario < ActiveRecord::Base
  
  has_many :chamado, :dependent => :destroy
  
  attr_accessor :senha
  attr_accessible :nome, :email, :senha, :senha_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  
  validates :nome, :presence => true, :length => { :maximum => 50 } 
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :senha, :presence => true, :confirmation => true, :length =>  { :within => 6..40 }
  
  before_save :encrypt_senha
  
  def has_senha? (submitted_senha)
    senha_criptografada == encrypt(submitted_senha)
  end
  
  def self.authenticate(email, submitted_senha) 
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_senha?(submitted_senha)
  end
  
  def self.pegar_salt(email)
    user = find_by_email(email)
    print user.salt
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt)? user : nil
  end
  
  private
    def encrypt_senha
      self.salt = make_salt if new_record?
      self.senha_criptografada = encrypt(senha)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{senha}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
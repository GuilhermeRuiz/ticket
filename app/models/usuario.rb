require 'digest'

class Usuario < ActiveRecord::Base
  
  has_many :chamados, :foreign_key => :id_usuario_criador, :dependent => :destroy
  has_many :comentarios, :foreign_key => :id_usuario, :dependent => :destroy
  
  attr_accessor :senha
  attr_accessible :nome, :email, :senha, :senha_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  
  validates :nome, :presence => true, :length => { :maximum => 50 } 
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :senha, :presence => true, :confirmation => true, :length =>  { :within => 6..40 }
  
  before_save :criptografar_senha
  
  def has_senha? (senha_recebida)
    senha_criptografada == criptografar(senha_recebida)
  end
  
  def self.autenticar(email, senha_recebida) 
    usuario = find_by_email(email)
    return nil if usuario.nil?
    return usuario if usuario.has_senha?(senha_recebida)
  end
  
  def self.get_salt(email)
    user = find_by_email(email)
    print user.salt
  end
  
  def self.autenticar_com_salt(id, cookie_salt)
    usuario = find_by_id(id)
    (usuario && usuario.salt == cookie_salt)? usuario : nil
  end
  
  private
    def criptografar_senha
      self.salt = make_salt if new_record?
      self.senha_criptografada = criptografar(senha)
    end
    
    def criptografar(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{senha}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
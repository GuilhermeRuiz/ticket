class Status < ActiveRecord::Base
  validates :titulo, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :descricao, :presence => true
end

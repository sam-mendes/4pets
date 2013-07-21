class User < ActiveRecord::Base
  has_secure_password #=> password_digest coluna no banco de dados
  belongs_to :role
  
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A.+@.+\..{2,4}\Z/
  validates_uniqueness_of :email

  def admin?
  	self.role.name == "admin"
  end
end

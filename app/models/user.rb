class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: { case_sensitive: true }
  
  has_secure_password
  
  after_destroy :ensure_an_admin_remains
  
  class Error < StandardError
  end
  
  private
    
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end
end

class ClientUser < ApplicationRecord
	belongs_to :client
	belongs_to :client_role
	 validates_presence_of :name, :email, :password_digest
   validates :email, uniqueness: true
    #encrypt password
   has_secure_password
end

class Client < ApplicationRecord
	  # has_many :client_roles, dependent: :destroy
	  has_many :client_users, dependent: :destroy
end

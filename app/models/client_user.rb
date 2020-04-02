class ClientUser < ApplicationRecord
	belongs_to :client
	belongs_to :client_role
end

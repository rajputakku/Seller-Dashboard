class AuthenticateClientUser
  prepend SimpleCommand
  attr_accessor :email, :password

  #this is where parameters are taken when the command is called
  def initialize(email, password)
    @email = email
    @password = password
  end
  
  #this is where the result gets returned
  def call
    JsonWebToken.encode(user_id: client_user.id) if client_user
  end

  private

  def client_user
    client_user = ClientUser.find_by_email(email)
    return client_user if client_user && client_user.authenticate(password)

    errors.add :client_user_authentication, 'Invalid credentials'
    nil
  end
end
class Api::V1::ClientUsersController < ApplicationController
	 # skip_before_action :verify_authenticity_token
   skip_before_action :authenticate_request, only: %i[login register]

def login
    authenticate params[:email], params[:password]
  end
  def test
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end

def create
  	@client_role = ClientRole.create(client_id: params[:client_id], name: params[:role_name])
  	@permissions = params[:permission_ids]
  	@permissions.each do |permissions|
    	@custome_role = CustomeRole.create(permission_id: permissions, client_role_id: @client_role.id)
    end
    @client_user = ClientUser.create(name: params[:name], email: params[:email],password: params[:password],client_id: params[:client_id], client_role_id: @client_role.id)
     if @client_user.save
    render json: @client_user, status: :created, location:     api_v1_client_clientusers_url(@client_user)
   else
    render json: @client_user.errors, status: :unprocessable_entity
   end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_client_user
   @client_user = ClientUser.find(params[:id])
  end
  def authenticate(email, password)
    command = AuthenticateClientUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end
  # Only allow a trusted parameter “white list” through.
  # def client_user_params
  # params.require(:client_user).permit(:name, :email, :password_digest, :client_id, :client_role_id)
  # end
end

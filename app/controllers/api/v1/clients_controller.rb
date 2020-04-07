class Api::V1::ClientsController < ActionController::API
	  # skip_before_action :verify_authenticity_token
    # skip_before_action :authenticate_request, only[:create]

def create
	@client = Client.new(client_params)
   if @client.save
    @client_role = ClientRole.create(client_id: @client, name: 'super_admin')
    @permissions = ['1', '2', '3', '4']
    @permissions.each do |permissions|
      @custome_role = CustomeRole.create(permission_id: permissions, client_role_id: @client_role.id)
    end
    @client_user = ClientUser.create(name: @client.name,email: @client.email, password: '12345',client_id: @client.id, client_role_id: @client_role.id)
    render json: @client, status: :created, location:     api_v1_client_url(@client)
   else
    render json: @client.errors, status: :unprocessable_entity
   end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_client
   @client = Client.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def client_params
  params.require(:client).permit(:name, :gstin, :contact_point, :code, :email)
  end
end

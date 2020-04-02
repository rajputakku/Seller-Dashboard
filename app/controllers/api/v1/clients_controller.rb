class Api::V1::ClientsController < ApplicationController
	  skip_before_action :verify_authenticity_token

def create
	@client = Client.new(client_params)
   if @client.save
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
  params.require(:client).permit(:name, :gstin, :contact_point, :code)
  end
end

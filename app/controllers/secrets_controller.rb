class SecretsController < ApplicationController
  load_and_authorize_resource
  def index
  	@secrets = Secret.find_by_sql('SELECT * FROM secrets ORDER BY created_at DESC LIMIT 40')
  end

  def compindex
  	@secrets = Secret.find_by_sql('SELECT * FROM secrets WHERE approved=false')
  end

  def show
  	@secret = Secret.find(params[:id])
  end

  def new 
  	@secret = Secret.new
    @lat_lng = cookies[:lat_lng]
  end

  def create
    @lat_lng = cookies[:lat_lng]
  	@secret = Secret.new(secret_params)
  	if @secret.save(secret_params)
  		redirect_to secrets_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@secret = Secret.find(params[:id])
  end

  def update
  	@secret = Secret.find(params[:id])
  	if @secret.update(secret_params)
  		redirect_to secrets_compindex_path
  	else 
  		render 'edit'
  	end
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to secrets_compindex_path
  end

  def secret_params
    params.require(:secret).permit(:rumor, :approved, :locdata)
	end
end

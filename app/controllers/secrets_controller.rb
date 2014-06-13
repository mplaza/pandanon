class SecretsController < ApplicationController
  def index
  	@secrets = Secret.find_by_sql('SELECT * FROM secrets WHERE approved=true ORDER BY created_at DESC LIMIT 10')
  end

  def compindex
  	@secrets = Secret.find_by_sql('SELECT * FROM secrets WHERE approved=false')
  end

  def show
  	@secret = Secret.find(params[:id])
  end

  def new 
  	@secret = Secret.new
  end

  def create
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
  		redirect_to secrets_path
  	else 
  		render 'edit'
  	end
  end

  def secret_params
    params.require(:secret).permit(:rumor, :approved )
	end
end

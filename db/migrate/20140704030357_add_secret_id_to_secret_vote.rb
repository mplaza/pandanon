class AddSecretIdToSecretVote < ActiveRecord::Migration
  def change
  	add_column :secretvotes, :secret_id, :integer
  end
end

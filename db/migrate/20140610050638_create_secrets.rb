class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.string :rumor
      t.boolean :approved

      t.timestamps
    end
  end
end

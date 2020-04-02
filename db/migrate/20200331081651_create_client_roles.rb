class CreateClientRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :client_roles do |t|
    	t.string :name
    	t.references :client, foreign_key: { to_table: :clients }, index: true
      t.timestamps
    end
  end
end

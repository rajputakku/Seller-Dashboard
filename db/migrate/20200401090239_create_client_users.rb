class CreateClientUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :client_users do |t|
		t.string :name
    	t.string :email
    	t.string :password_digest, null:false
		t.references :client, foreign_key: { to_table: :clients }, index: true
    	t.references :client_role, foreign_key: { to_table: :client_roles }, index: true
      t.timestamps
    end
  end
end

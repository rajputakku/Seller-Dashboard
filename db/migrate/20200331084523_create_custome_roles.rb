class CreateCustomeRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :custome_roles do |t|
    	t.references :client_role, foreign_key: { to_table: :client_roles }, index: true
    	t.references :permission, foreign_key: { to_table: :permissions }, index: true

      t.timestamps
    end
  end
end

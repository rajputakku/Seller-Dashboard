class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :permission

      t.timestamps
    end
  end
end

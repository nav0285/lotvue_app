class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.boolean :hidden
      t.timestamps
    end
  end
end

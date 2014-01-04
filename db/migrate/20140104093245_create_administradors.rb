class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.string :usuario
      t.string :password
      t.string :mail

      t.timestamps
    end
  end
end

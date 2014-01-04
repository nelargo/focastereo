class CreateProfesors < ActiveRecord::Migration
  def change
    create_table :profesors do |t|
      t.string :nombre
      t.string :rol
      t.string :password
      t.string :departamento
      t.string :mail
      t.string :oficina

      t.timestamps
    end
  end
end

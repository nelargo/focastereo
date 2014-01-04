class CreateEditarCursos < ActiveRecord::Migration
  def change
    create_table :editar_cursos do |t|
      t.integer :identificador
      t.string :nombre
      t.string :profesor
      t.integer :cant_ayudantes
      t.string :tipo_ayudante
      t.string :comentario

      t.timestamps
    end
  end
end

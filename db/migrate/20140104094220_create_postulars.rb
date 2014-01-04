class CreatePostulars < ActiveRecord::Migration
  def change
    create_table :postulars do |t|
      t.integer :id_alumno
      t.string :nom_ramo
      t.string :tipo_postulacion
      t.integer :prioridad
      t.integer :prioridad_alumno
      t.integer :num_veces_ayu

      t.timestamps
    end
  end
end

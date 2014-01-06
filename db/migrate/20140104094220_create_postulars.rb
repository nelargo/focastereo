class CreatePostulars < ActiveRecord::Migration
  def change
    create_table :postulars do |t|
      t.integer   :id_alumno
      t.integer   :id_ramo
      t.boolean   :cat
      t.boolean   :lab
      t.boolean   :cor
      t.integer   :prioridad
      t.integer   :prioridad_alumno
      t.integer   :num_veces_ayu
      t.string    :status

      t.timestamps
    end
  end
end

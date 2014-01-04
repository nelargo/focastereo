class CreateExperiencia < ActiveRecord::Migration
  def change
    create_table :experiencia do |t|
      t.string :sigla
      t.string :nombre_curso
      t.string :campus
      t.string :profesor
      t.string :departamento

      t.timestamps
    end
  end
end

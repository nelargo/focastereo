class CreateExperiencia < ActiveRecord::Migration
  def change
    create_table :experiencia do |t|
      t.string :sigla
      t.string :nom_asignatura
      t.string :campus
      t.string :profesor
      t.string :departamento

      t.timestamps
    end
  end
end

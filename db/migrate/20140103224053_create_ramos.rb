class CreateRamos < ActiveRecord::Migration
  def change
    create_table :ramos do |t|
      t.string :sigla
      t.string :nombre
      t.string :profesor
      t.integer :num_ayudantes
      t.string :tipo_ayudante
      t.string :campus
      t.string :departamento
      t.string :area
      t.integer :creditos

      t.timestamps
    end
  end
end

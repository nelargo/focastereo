class CreateRamos < ActiveRecord::Migration
  def change
    create_table :ramos do |t|
      t.string :sigla
      t.string :nombre
      t.string :profesor
      t.integer :num_ayudantes
      t.boolean :tipo_ayudante_cat
      t.boolean :tipo_ayudante_lab
      t.boolean :tipo_ayudante_cor
      t.string :campus
      t.string :departamento
      t.string :area
      t.integer :creditos
      t.boolean :activo

      t.timestamps
    end
  end
end

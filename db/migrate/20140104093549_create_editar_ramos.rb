class CreateEditarRamos < ActiveRecord::Migration
  def change
    create_table :editar_ramos do |t|
      t.integer :id_ramo
      t.string :sigla
      t.string :nombre
      t.integer :cant_ayudantes
      t.string :tipo_ayudante
      t.string :criterio

      t.timestamps
    end
  end
end

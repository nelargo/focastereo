class CreateEditarRamos < ActiveRecord::Migration
  def change
    create_table :editar_ramos do |t|
      t.integer :id_ramo
      t.string :sigla
      t.string :nombre
      t.integer :cant_ayudantes
      t.boolean :tipo_ayudante_cat
      t.boolean :tipo_ayudante_lab
      t.boolean :tipo_ayudante_cor
      t.string :criterio

      t.timestamps
    end
  end
end

class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.integer :activa

      t.timestamps
    end
  end
end

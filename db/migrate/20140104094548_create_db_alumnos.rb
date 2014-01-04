class CreateDbAlumnos < ActiveRecord::Migration
  def change
    create_table :db_alumnos do |t|

      t.timestamps
    end
  end
end

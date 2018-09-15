class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.string :descripcion

      t.timestamps
    end
  end
end

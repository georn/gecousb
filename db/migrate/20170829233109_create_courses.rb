class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code, limit: 6
      t.string :name, limit: 20
      t.string :department, limit: 65

      t.timestamps
    end
    add_index :courses, :code, unique: true
  end
end

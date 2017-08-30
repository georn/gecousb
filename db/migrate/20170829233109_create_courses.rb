class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code, limit: 6
      t.string :department, limit: 65
      # t.string :careers, limit: 4
      t.references :courses_plan, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
    add_index :courses, :code, unique: true
  end
end

class CreateCoursesPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_plans do |t|
      t.date :start_date
      t.date :end_date
      t.references :course
      t.references :user

      t.timestamps
    end
  end
end

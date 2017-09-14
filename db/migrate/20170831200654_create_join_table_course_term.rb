class CreateJoinTableCourseTerm < ActiveRecord::Migration[5.1]
  def change
    create_join_table :courses, :terms do |t|
      t.index [:course_id, :term_id]
      t.index [:term_id, :course_id]
    end
  end
end

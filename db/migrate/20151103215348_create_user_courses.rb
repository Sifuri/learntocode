class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|

      t.timestamps null: false
    end
  end
end

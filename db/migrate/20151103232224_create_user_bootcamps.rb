class CreateUserBootcamps < ActiveRecord::Migration
  def change
    create_table :user_bootcamps do |t|

      t.timestamps null: false
    end
  end
end

class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|

      t.timestamps null: false
    end
  end
end

class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.belongs_to :user 
    	t.belongs_to :connection

      t.timestamps null: false
    end
  end
end

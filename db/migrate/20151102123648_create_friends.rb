class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
    	t.belongs_to :user 
    	t.belongs_to :connection 

      t.timestamps null: false
    end
  end
end

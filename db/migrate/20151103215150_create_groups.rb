class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.belongs_to :user
    	t.belongs_to :event 

    	t.string :title
    	t.string :desc
    	t.integer :qty

      t.timestamps null: false
    end
  end
end

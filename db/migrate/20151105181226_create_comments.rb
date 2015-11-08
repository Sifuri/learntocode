class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.belongs_to :user
    	t.belongs_to :event, index: true, foreign_key: true 

    	t.string :commenter
    	t.text :content

      t.timestamps null: false
    end
  end
end

class CreateGroupComments < ActiveRecord::Migration
  def change
    create_table :group_comments do |t|
    	t.belongs_to :user
    	t.belongs_to :group

    	t.string :commenter
    	t.text :content

      t.timestamps null: false
    end
  end
end

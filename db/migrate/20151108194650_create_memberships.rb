class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.belongs_to :user 
    	t.belongs_to :group
    	t.integer :host

      t.timestamps null: false
    end
  end
end
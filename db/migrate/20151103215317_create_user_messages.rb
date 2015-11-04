class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
    	t.belongs_to :giver
    	t.belongs_to :receiver 

      t.timestamps null: false
    end
  end
end

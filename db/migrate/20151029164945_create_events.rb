class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.boolean :online
      t.integer :zip
      t.string :topic
      t.string :distance
      t.float :longitude
      t.float :latitude 
      t.string :city 
      t.string :state
      t.string :url
      t.string :group_id

      t.timestamps null: false
    end
  end
end

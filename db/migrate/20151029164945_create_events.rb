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
      t.integer :group_id
      t.integer :rsvp
      t.string :time 
      t.string :time_zone

      t.timestamps null: false
    end
  end
end

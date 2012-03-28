class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :lang, :limit => 2
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :phone, :null => false
      t.string :email, :null => false
      t.string :address, :null => false
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.integer :seo_data_id
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end

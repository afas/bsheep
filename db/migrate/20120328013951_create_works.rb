class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :lang, :limit => 2
      t.string :title, :null => false
      t.text :description, :null => false
      t.text :full_text
      t.boolean :with_web_page
      t.string :web_url
      t.integer :tape_color

      t.integer :seo_data_id
      t.integer :item_order, :default => 0
      t.integer :user_id, :null => false

      t.string :short_url, :null => false
      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at

      t.timestamps
    end
  end
end

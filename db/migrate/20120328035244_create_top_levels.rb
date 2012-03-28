class CreateTopLevels < ActiveRecord::Migration
  def change
    create_table :top_levels do |t|
      t.string :lang, :limit => 2
      t.string :title, :null => false
      t.text :description
      t.integer :seo_data_id
      t.integer :item_order, :default => 0
      t.integer :user_id, :null => false
      t.string :short_url, :null => false

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end

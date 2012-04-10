class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :lang, :limit => 2
      t.string :title, :null => false
      t.text :description, :null => false
      t.text :full_text
      t.text :sign_board_text

      t.integer :seo_data_id
      t.integer :user_id, :null => false
      t.string :short_url, :null => false

      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at

      t.string :sign_board_image_file_name
      t.string :sign_board_image_content_type
      t.integer :sign_board_image_file_size
      t.datetime :sign_board_image_updated_at

      t.timestamps
    end
  end
end

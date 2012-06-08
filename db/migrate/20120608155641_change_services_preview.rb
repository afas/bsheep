class ChangeServicesPreview < ActiveRecord::Migration
  def change
    rename_column :services, :preview_file_name, :presentation_file_name
    rename_column :services, :preview_content_type, :presentation_content_type
    rename_column :services, :preview_file_size, :presentation_file_size
    remove_column :services, :preview_updated_at
  end
end

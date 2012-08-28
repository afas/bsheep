class AddPublishedToTopLevel < ActiveRecord::Migration
  def change
    add_column :top_levels, :published, :boolean, :default => true
  end
end

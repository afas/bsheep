class AddPublishToWork < ActiveRecord::Migration
  def change
    add_column :works, :published, :boolean, :default => true
  end
end

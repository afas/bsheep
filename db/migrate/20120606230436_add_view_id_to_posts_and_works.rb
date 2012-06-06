class AddViewIdToPostsAndWorks < ActiveRecord::Migration
  def change
    add_column :works, :view_id, :integer, :default => 0
    add_column :posts, :view_id, :integer, :default => 0
  end
end

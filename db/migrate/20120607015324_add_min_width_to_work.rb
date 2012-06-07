class AddMinWidthToWork < ActiveRecord::Migration
  def change
    add_column :works, :width, :integer
  end
end

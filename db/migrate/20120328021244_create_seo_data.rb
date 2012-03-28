class CreateSeoData < ActiveRecord::Migration
  def change
    create_table :seo_data do |t|
      t.string :title
      t.string :keywords
      t.text :description
    end
  end
end

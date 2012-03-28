#encoding:utf-8
class Welcome < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'
  belongs_to :seo_data

  validates_presence_of :title, :user_id, :lang, :phone, :email, :address
  validates_uniqueness_of :title

  acts_as_gmappable :check_process => false

  def gmaps4rails_address
    "#{self.address}"
  end

  def gmaps4rails_marker_picture
    {
        "picture" => "/favicon.png",
        "width" => "20",
        "height" => "20",
        "marker_anchor" => [5, 10],
        "shadow_picture" => "/favicon.png",
        "shadow_width" => "110",
        "shadow_height" => "110",
        "shadow_anchor" => [5, 10],
    }
  end

end

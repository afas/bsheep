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
        "picture" => "assets/marker.png",
        "width" => "24",
        "height" => "31",
        "marker_anchor" => [12, 23],
        "shadow_picture" => "assets/shadow_marker.png",
        "shadow_width" => "25",
        "shadow_height" => "24",
        "shadow_anchor" => [2, 16]
    }
  end

end

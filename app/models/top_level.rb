#encoding:utf-8
class TopLevel < ActiveRecord::Base
  include_web_page

  default_scope order("item_order")

  has_attached_file :image,
                    :styles => {
                        :social_preview => '121x121>',
                        :good => '790x610>'
                    },
                    :default_url => '/top_level/default.png',
                    :url => '/top_level/:id/:style_:basename.:extension'

  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png'], :message => I18n.t("paperclip.bad_file_format")

end

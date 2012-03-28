#encoding:utf-8
class Work < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'
  belongs_to :seo_data

  validates_presence_of :title, :user_id, :lang
  validates_uniqueness_of :title, :short_url

  before_save :generate_short_url

  self.per_page = 8

  #default_scope order("item_order, id DESC")

  has_attached_file :preview,
                    :styles => {
                        :social_preview => '121x121#',
                        :medium => '333x400>',
                        :big => '710x330>'
                    },
                    :default_url => '/work/default.png',
                    :url => '/work/:id/:style_:basename.:extension'

  #validates_attachment_presence :preview
  #validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => "Неверный формат файла изображения."

  private

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.nil? && !self.title.nil?
  end
end

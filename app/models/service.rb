class Service < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :seo_data

  validates_presence_of :title, :user_id, :lang
  validates_uniqueness_of :title, :short_url

  before_save :generate_short_url

  default_scope order("item_order, id DESC")

  has_attached_file :presentation,
                    :url => '/service_presentations/:id/:style_:basename.:extension'

  #validates_attachment_presence :preview
  #validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => I18n.t("paperclip.bad_file_format")

  private

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.nil? && !self.title.nil?
  end

end

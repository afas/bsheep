class Post < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'
  belongs_to :seo_data

  validates_presence_of :title, :description, :full_text, :user_id, :lang
  validates_uniqueness_of :title, :short_url

  before_save :generate_short_url

  self.per_page = 5

  default_scope order("id DESC")

  has_attached_file :preview,
                    :styles => {
                        :social_preview => '121x121#',
                        :big => '700x600>'
                    },
                    :default_url => '/post/default.png',
                    :url => '/post/:id/:style_:basename.:extension'

  #validates_attachment_presence :preview
  #validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => I18n.t("paperclip.bad_file_format")

  has_attached_file :sign_board_image,
                    :styles => {
                        :preview => '130x130#'
                    },
                    :default_url => '/work/default.png',
                    :url => '/post/:id/:style_:basename.:extension'

  #validates_attachment_presence :preview
  #validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png'], :message => I18n.t("paperclip.bad_file_format")

  private

  def generate_short_url
    self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.nil? && !self.title.nil?
  end

end

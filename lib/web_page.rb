module WebPage
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def include_web_page
      before_save :generate_short_url

      belongs_to :author, :class_name => 'User'
      belongs_to :seo_data

      validates_presence_of :title, :short_url, :user_id, :lang
      validates_uniqueness_of :title, :short_url

      include(InstanceMethods)
    end
  end

  module InstanceMethods

    private

    def generate_short_url
      self.short_url = Russian.transliterate(self.title.gsub(' ', '-')) if self.short_url.nil? && !self.title.nil?
    end
  end
end

ActiveRecord::Base.send(:include, WebPage)
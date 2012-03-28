module ApplicationHelper

  def title(target)
    content_for(:title) { target.seo_data.nil? ? target.title || t('title') : target.seo_data.title }
  end

  def seo_data(target)
    if target.seo_data.nil?
      content_for(:description) { t('description') }
      content_for(:keywords) { t('keywords') }
    else
      content_for(:description) { target.seo_data.description.nil? ? t('description') : target.seo_data.description }
      content_for(:keywords) { target.seo_data.keywords.nil? ? t('keywords') : target.seo_data.keywords.gsub('"', '\"') }
    end
  end

end

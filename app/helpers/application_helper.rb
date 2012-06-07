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

  def controls_panel(object)
    edit_path = send("edit_#{object.class.to_s.downcase}_path", object)

    begin
      confirm_text = "Do you realy want delete \"#{object.title}\"?"
    rescue NoMethodError
      confirm_text = 'Are you sure?'
    end

    links = nil
    links  = "<li>" + link_to('Edit', edit_path) + "</li>" if can?(:update, object)
    links += "<li>" + link_to('Delete', object, :confirm => confirm_text, :method => :delete)  + "</li>" if can?(:destroy, object)
    links = '<div class="panel-admin"><ul>' + links + '</ul></div><div class="clearfix"></div>' if can?(:manage, object)

    raw links
  end

end

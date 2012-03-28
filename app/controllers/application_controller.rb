class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :default_data

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def default_data
    @top_level_list = TopLevel.where(:lang => I18n.locale)
    @welcome = Welcome.where(:lang => I18n.locale).first
    @map = Welcome.where(:lang => I18n.locale).first.to_gmaps4rails
  end

end

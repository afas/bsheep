# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bsheep::Application.initialize!

#require File.expand_path('../../lib/web_page', __FILE__)
#require File.dirname(__FILE__) + '/../lib/stars_form_builder'
require File.expand_path('../../lib/stars_form_builder', __FILE__)

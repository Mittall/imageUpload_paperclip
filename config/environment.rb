# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ImageUploadPaperclip::Application.initialize!

#
Paperclip.options[:command_path] = "/usr/local/bin/"

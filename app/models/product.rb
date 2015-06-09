class Product < ActiveRecord::Base
	#specify that the avatar is a paperclip file attachment
  #specify additional styles that you want to use in views or eslewhere
  has_attached_file :avatar, :styles => {:thumb => "100x100>"}
  
  #specify that the resume is a paperclip file attachment
  has_attached_file :resume


	#validates :avatar, :attachment_presence => true
	#validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	#validates_with AttachmentPresenceValidator, :attributes => :avatar

	validates_attachment :avatar,
  :content_type => {:content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg','image/png', 'image/tif', 'image/gif'],
										#:convert_options => { :all => '-background black -flatten +matte'},
										#:default_url => "/assets/:style/images.jpg",
										
										:message => "has to be in a proper format"}, 
										:size => { :in => 0..5.megabytes }

	validates_attachment :resume, 
  #:content_type => {:content_type => ["doc","docx","pdf","xls","xlsx"], :message => "has to be in a proper format"},
	:message => "has to be in a proper format",
  :size => { :in => 0..25.megabytes }
	
end

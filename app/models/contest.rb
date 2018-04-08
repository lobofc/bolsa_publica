class Contest < ActiveRecord::Base
	has_attached_file :document
	validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocuments.wordprocessingml.document)}

	validates :titulo, :descripcion, presence:true,
	                                 length: { minimum: 5 }
end

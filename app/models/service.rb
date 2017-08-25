class Service < ApplicationRecord
	searchkick word_start: [:title, :description]
	belongs_to :user
	has_many :reviews, dependent: :destroy
	
	has_attached_file :image
	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
	
	 def search_data
    {
      title: title,
      description: description 
    }
  	end
end

class Image < ApplicationRecord
  has_attached_file :content,
  :styles => {
  	:large => "1000x1000#",
    :medium => "500x500#",
    :thumb => "150x150#"
  }


    validates_attachment_content_type :content, :content_type => ["image/gif"]
  

	has_and_belongs_to_many :sections

	validates :name, presence: true
	validates :description, presence: true
	validates :content, presence: true
  validates_presence_of :content
  validates_presence_of :description
  validates_presence_of :name

     rails_admin do
	list do
		exclude_fields :content
	end
   end
end

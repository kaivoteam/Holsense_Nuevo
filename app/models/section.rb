class Section < ApplicationRecord
	belongs_to :subject
	belongs_to :level
	has_many :requests, :dependent => :delete_all
	#imagen
	has_and_belongs_to_many :images, through: :images_sections

	validates :name, presence: true
	validates_uniqueness_of :name
  validates_presence_of :name
end

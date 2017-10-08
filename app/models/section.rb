class Section < ApplicationRecord
	belongs_to :subject
	belongs_to :level
	has_many :requests
	#imagen
	has_and_belongs_to_many :images

	validates :name, presence: true
  validates_presence_of :name
end

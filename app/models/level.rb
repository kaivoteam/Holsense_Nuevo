class Level < ApplicationRecord
	has_many :sections

	validates :name, presence: true
  validates_presence_of :name
end

class Level < ApplicationRecord
	has_many :sections, :dependent => :delete_all

	validates :name, presence: true
  validates_presence_of :name
  validates_uniqueness_of :name
end

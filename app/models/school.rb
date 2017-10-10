class School < ApplicationRecord
	has_many :users

	validates :name, presence: true
	validates :phone, presence: true
	validates :email, presence: true
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone
  #verificar
  validates_format_of :phone, :with => /[0-9]{9}/  #9 numeros

  has_attached_file :avatar,:styles => {:thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200", 
                        :large => "400x400"},
                    default_style: :thumb,
                    default_url: "/assets/default_school_:style.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method: 
  attr_accessor :delete_avatar
  before_validation { self.avatar.clear if self.delete_avatar == '1' }

  rails_admin do
	list do
		exclude_fields :avatar
	end
   end
end

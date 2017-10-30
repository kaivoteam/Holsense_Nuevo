class Request < ApplicationRecord
	belongs_to :user
	#agregar otro user aca?

#	has_one :utp_role, class_name: 'User', foreign_key: :utp_role_id
#  	has_one :teacher_role, class_name: 'User', foreign_key: :teacher_role_id

	belongs_to :section

	validates :comment, presence: true
	validates :status, presence: true
	validates :mail_requester, presence: true
  validates_presence_of :status
  validates_presence_of :mail_requester
  validates_presence_of :comment

end

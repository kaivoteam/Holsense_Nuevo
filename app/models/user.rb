class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,:styles => {:thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200", 
                        :large => "400x400",
                        :perfil => "50x50"},
                    default_style: :thumb,
                    default_url: "/assets/default_avatar_:style.png"
                    #default_url: "/missing_:style.png"


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # add a delete_<asset_name> method: 
  attr_accessor :delete_avatar
  before_validation { self.avatar.clear if self.delete_avatar == '1' }


  belongs_to :school
  has_many :requests

  #para login por nickname
  attr_accessor :login


  validates :nickname, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates_uniqueness_of :nickname

  validates_presence_of :nickname
  validates_presence_of :password, :password_confirmation, on: :create

  rails_admin do
 		list do
 			exclude_fields :password
 			exclude_fields :password_confirmation
 			exclude_fields :reset_password_sent_at
 			exclude_fields :subjects
 			exclude_fields :avatar
      exclude_fields :school

      #elementos no necesarios
      exclude_fields :remember_created_at
      exclude_fields :sign_in_count
      exclude_fields :current_sign_in_at
      exclude_fields :current_sign_in_ip
      exclude_fields :last_sign_in_ip
      exclude_fields :last_sign_in_at
 		end
 		create do
 			exclude_fields :reset_password_sent_at
 			exclude_fields :last_sign_in_at

      #elementos no necesarios
      exclude_fields :created_at
      exclude_fields :updated_at
      exclude_fields :remember_created_at
      exclude_fields :sign_in_count
      exclude_fields :current_sign_in_at
      exclude_fields :current_sign_in_ip
      exclude_fields :last_sign_in_ip
      exclude_fields :last_sign_in_at
 		end
    edit do
      exclude_fields :last_sign_in_at

      #elementos no necesarios
      exclude_fields :created_at
      exclude_fields :updated_at
      exclude_fields :remember_created_at
      exclude_fields :sign_in_count
      exclude_fields :current_sign_in_at
      exclude_fields :current_sign_in_ip
      exclude_fields :last_sign_in_ip
      exclude_fields :last_sign_in_at
    end
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login=conditions.delete(:login)
    where(conditions).where(["lower(nickname)=:value OR lower(email)=:value",{value:login.strip.downcase}]).first
  end

  protected

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions attributes = {}
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end

  def self.find_recoverable_or_initialize_with_errors required_attributes, attributes, error = :invalid
    (case_insensitive_keys || []).each {|k| attributes[k].try(:downcase!)}

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if {|_key, value| value.blank?}

    if attributes.size == required_attributes.size
      if attributes.key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end

  def self.find_record login
    where(["nickname = :value OR email = :value", {value: login}]).first
  end

  #para que no requiera mail
  def email_required?
    false
  end
end

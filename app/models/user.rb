class User < ActiveRecord::Base
  has_one  :session
  has_many :symptoms, :through => :user_symptoms
  has_many :user_symptoms
  belongs_to :user_type

  has_many :diagnoses, :through => :user_diagnoses
  has_many :user_diagnoses
  has_many :uploads

  has_secure_password
  #Callbacks because some database adapters use case-sensitive indices
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  validates :firstname, presence: true, length: {minimum: 3, maximum: 25}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 35}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 5, maximum: 255}, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }, :if => :email_changed?
  validates :username, presence: true, length: {minimum: 5, maximum: 15},
                      uniqueness: { case_sensitive: false }, :if => :username_changed?
  validates :password, length: { minimum: 6 }, :if => :password_digest_changed?

  validates :user_type_id, presence: true

  scope :active, -> { where(is_active: true) }

  def self.authenticate(email, password)
    user = User.active.find_by(email: email).try(:authenticate, password)
    return nil unless user
    user.generate_auth_token
  end

  def generate_auth_token
    payload = { user_id: self.id }
    Domain::Api::AuthToken.encode(payload)
  end

  def serializable_hash options={}
    super(except: [:created_at, :updated_at, :password_digest, :is_active])
  end
end

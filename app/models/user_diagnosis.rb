class UserDiagnosis < ActiveRecord::Base

  belongs_to :user
  belongs_to :diagnosis


  validates :user_id, presence: true
  validates :diagnosis_id, presence: true

end
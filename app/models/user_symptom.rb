class UserSymptom < ActiveRecord::Base
  belongs_to :user
  belongs_to :symptom


  validates :user_id, presence: true
  validates :symptom_id, presence: true

end
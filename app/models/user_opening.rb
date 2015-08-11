class UserOpening < ActiveRecord::Base
  belongs_to :user
  belongs_to :opening

  validates :user_id, presence: true
  validates :opening_id, presence: true
end

class User < ApplicationRecord
  belongs_to :department
  has_many :assignments
  has_many :shifts, through: :assignments
  has_many :leave_records
end

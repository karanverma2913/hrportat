class Event < ApplicationRecord
	validates :name, :desc, presence: true
  validates :date, presence: { message: 'Invalid date' }
  validates :name, uniqueness: true,
                   format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'should not contain numbers' }
  validate :valid_date
end

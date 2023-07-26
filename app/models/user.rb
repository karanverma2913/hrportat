# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :password, :email, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                             message: 'should be in characters only' }

  validates :password, length: { in: 8..15, message: 'must be between 8 to 15 characters' }

  validates :email, uniqueness: { message: 'is already exist' },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: '%<value>s not a valid email !!!' }

  def is_hr?
    type == 'Hr'
  end

  def is_employee?
    type == 'Employee'
  end
end

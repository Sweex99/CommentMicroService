# frozen_string_literal: true

# good
class User < ApplicationRecord
  self.table_name = 'users'
  has_many :comments, dependent: :destroy
end

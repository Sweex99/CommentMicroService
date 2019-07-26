# frozen_string_literal: true

# good
class User < ApplicationRecord
  has_many :comments, dependent: :destroy
end

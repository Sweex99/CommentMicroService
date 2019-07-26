# frozen_string_literal: true

# good
class Product < ApplicationRecord
    has_many :comments, dependent: :destroy
end

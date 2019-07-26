# frozen_string_literal: true

# good
class Product < ApplicationRecord
  # set_table_name 'products'
  has_many :comments, dependent: :destroy
end

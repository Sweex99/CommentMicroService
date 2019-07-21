# good
class Comment < ApplicationRecord
  attr_reader :text, :user_id, :product_id
  validates :user_id, presence: true
end

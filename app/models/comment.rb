# frozen_string_literal: true

# good
class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments, class_name: 'Comment', foreign_key: 'comment_id'
end

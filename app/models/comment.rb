# frozen_string_literal: true

# good
class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments, class_name: 'Comment', foreign_key: 'comment_id'
  validates :text,
            presence: true
  validates :product_id,
            presence: true,
            numericality: { only_integer: true }
  validates :user_id,
            numericality: { only_integer: true }

  private

  def comment_id_empty?
    bool = comment_id.nil?
    Rails.logger.debug(bool)
  end
end

# frozen_string_literal: true

# good
class CommentTransferObject
  attr_accessor :product_id

  def initialize(product_id)
    @product_id = product_id
  end

  def return_dto_object
    Comment.where(product_id: @product_id)
           .includes(:user)
           .map do |a|
             {
               'id' => a.id,
               'text' => a.text,
               'user_name' => a.user['username']
             }
           end
  end
end

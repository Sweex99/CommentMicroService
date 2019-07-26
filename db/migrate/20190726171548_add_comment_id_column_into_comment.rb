class AddCommentIdColumnIntoComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comment, :comment_id, :integer
  end
end

class Commentvote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates :user_id, :comment_id, :presence => true
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commentvotes

  validates :user_id, :post_id, :content, :presence => true
end

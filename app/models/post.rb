class Post < ActiveRecord::Base
  has_many :comments
  has_many :postvotes
  belongs_to :user

  validates :title, :uniqueness => true
  validates :title, :content, :user_id, :presence => true

end

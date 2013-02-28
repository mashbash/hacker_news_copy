class User < ActiveRecord::Base
  has_many :posts
  has_many :postvotes
  has_many :commentvotes
  has_many :comments

  validates :username, :uniqueness => true
  validates :username, :password, :presence => true
end

class Place < ActiveRecord::Base
  has_many :pics
  belongs_to :user
  acts_as_votable
  acts_as_commentable
  has_many :comments
  def score
    self.get_upvotes.size
  end
end

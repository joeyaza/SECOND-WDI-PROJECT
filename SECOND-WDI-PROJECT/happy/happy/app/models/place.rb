class Place < ActiveRecord::Base
  has_many :pics
  belongs_to :user
end

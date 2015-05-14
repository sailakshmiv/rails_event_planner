class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :comment, :presence => true, :length => { :in => 8..500 }
end

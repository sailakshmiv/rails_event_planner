class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :name, :date, :city, :presence => true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
  	if date.present? && date < Date.today
  		errors.add(:date, "can't be in the past")
  	end
  end
end

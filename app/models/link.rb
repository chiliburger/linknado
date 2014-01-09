class Link < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates_presence_of :name, :uri, :username
  validates_numericality_of :points, :only_integer => true, :greater_than_or_equal_to => 0

  default_scope { order('points Desc') }

  def add_point
    self.update_attribute(:points, points + 1)
  end

  def remove_point
    if points > 0
      self.update_attribute(:points, points - 1)
    else
      true
    end
  end
end

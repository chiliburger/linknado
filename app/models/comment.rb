class Comment < ActiveRecord::Base
  belongs_to :link

  validates_presence_of :link_id, :username, :body
end

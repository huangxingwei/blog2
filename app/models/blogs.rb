class Blogs < ActiveRecord::Base
  attr_accessible :author, :content, :title
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :content
end

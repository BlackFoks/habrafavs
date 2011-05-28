class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :habrauser
  has_many :favs, :dependent => :nullify
end

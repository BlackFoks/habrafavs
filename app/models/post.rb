class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :habrauser
end

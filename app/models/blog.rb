class Blog < ActiveRecord::Base
  has_many :posts, :dependent => :nullify
end

class User < ActiveRecord::Base
  has_many :habrausers, :dependent => :nullify
  has_many :favs, :dependent => :nullify
end

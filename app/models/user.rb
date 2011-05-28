class User < ActiveRecord::Base
  has_many :habrausers, :dependent => :nullify
end

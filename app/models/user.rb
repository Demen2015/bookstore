class User < ActiveRecord::Base
  validates :tel, length: { is: 9 }
  validates :password, length: { minimum: 6 }
end

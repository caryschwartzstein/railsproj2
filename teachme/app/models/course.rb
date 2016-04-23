class Course < ActiveRecord::Base
	has_many :adminships
	has_many :admins, :through => :adminships, :source => :user
	has_many :subscriptions
	has_many :users, :through => :subscriptions
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :adminships
  has_many :admin_courses, :through => :adminships, :source => :course
  has_many :subscriptions
  has_many :courses, :through => :subscriptions
end

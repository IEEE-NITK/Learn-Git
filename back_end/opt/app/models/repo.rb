class Repo < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
             belongs_to :course
            serialize :order
end

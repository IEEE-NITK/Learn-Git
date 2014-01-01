class Team < ActiveRecord::Base
	serialize :ordera , :orderb
	has_and_belongs_to_many :users
	has_many :repos
end

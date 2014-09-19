class Team < ActiveRecord::Base
    belongs_to :course
    has_and_belongs_to_many :users
    has_many :repos
end

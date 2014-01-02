class Course < ActiveRecord::Base
    has_many :stages
    has_many :repos
    #validates_presence_of :objective,:problem,:prerequisites,:references,:mcount,:author_id
end

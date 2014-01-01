class Course < ActiveRecord::Base
    has_many :stages
    #validates_presence_of :objective,:problem,:prerequisites,:references,:mcount,:author_id
end

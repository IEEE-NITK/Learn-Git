class Course < ActiveRecord::Base
    has_many :stages
    validates_presence_of :objective,:problem,:prerquisites,:references,:mcount,:author_id

end

class Stage < ActiveRecord::Base
    belongs_to :course
    serialize :hints
    serialize :validation

    #validates_presence_of :course_id,:step_number,:objective,:hints,:commit_number,:validation

end

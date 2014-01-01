class ProjectController < ApplicationController

    def index
    end

    def createProject
        name = getRandomName.gsub(" ","_")
        repo = Repo.create(user_id: current_user.id, name: name+"_git",path: "../../repositories/#{name}_git" )
        `mkdir ../../repositories/#{name}_git`
        puts "repository created!"
        render nothing: true
    end

    def newStep
        p = params
        s = Stage.new
        s.course_id = p[:course_id]
        c = Course.where(id: p[:course_id])
        if(c)
            s.step_number = c.steps.last[:step_number]+1 unless c.steps.nil?
            s.step_number = 1 if c.steps.nil?
            s.objective = p[:objective]
            s.hints = p[:hints]
            s.references = p[:references]
            s.useful_links = p[:userful_links]
            s.extras = p[:extras]
            s.validation = p[:validation]
            s.save
        end
    end

    def createCourse
        p  =params
        c = Course.new
        c.objective = p[:objective]
        c.problem = p[:problem]
        c.prerequisites = p[:pre]
        c.author = current_user.id
        c.rating = 0
        c.references = p[:references]
        c.useful_materials = p[:mat]
        c.mcount = p[:mcount]
        c.save
    end


end

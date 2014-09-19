module RepoHelper

    def createRepo(course_id,team_id)
        course = Course.find(course_id)
        if !course.nil?
            z = SecureRandom.hex(16)
            repo = Repo.new
            repo.name = z #TODO: Allow user to name his repo?
            repo.user_id = current_user.id
            repo.team_id = team_id
            repo.course_id = course_id
            repo.status = 1
            `mkdir #{Dir.pwd}/../repositories/#{z}/`
            repo.path ="../repositories/#{z}/#{course_id}"
            #Copy the contents of the course to the repository
            `cp -r #{Dir.pwd}/../courses/#{course_id} ../repositories/#{z}`
            repo.order = (1..course.stages.count).to_a #TODO: Order to be populated dynamically
            repo.save
        end
    end


end

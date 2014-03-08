module TeamHelper

        def create_team(id)
                team = Team.new
                team.name = "#{current_user.email}_course1"
                team.status = 0.00
                team.course_id = id
                team.acceptedInvites = 1
                team.save
                current_user.team_ids << team.id
                current_user.save
                createRepo(id,team.id)
        end

end

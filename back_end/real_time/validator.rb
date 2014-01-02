class Validator

	attr_accessor :stage

	def initialize(rid)
		@repo = Repo.where(id: rid).first
		@stage = Stage.where(step_number: @repo.status,course_id: @repo.course_id).first
		puts @stage.inspect
		# @stage=Stade.find(stid)
	end

	def validate msg,output
		if @stage && @stage.validation[0] == "cmd_r"
			if (msg =~ /#{@stage.validation[1]}+/).nil?
				return false
			else
				#This will be more complicated!![TODO]
				@repo.status+=1
				@repo.save
				return true
			end
		end	
	end

	def next_stage
		@stage = Stage.where(step_number: @repo.status,course_id: @repo.course_id).first
	end

end
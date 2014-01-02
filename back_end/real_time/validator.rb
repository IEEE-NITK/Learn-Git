class Validator

	attr_accessor :stage

	def initialize(rid)
		@repo = Repo.where(id: rid).first
		@stage = Stage.where(step_number: @repo.status,course_id: @repo.course_id).first
		puts @stage.inspect
		# @stage=Stade.find(stid)
	end

	def validate msg,output
		puts "***********WRONGjhesgbuhy!************"*100
		if @stage && @stage.validation[0] == "cmd_r"
			puts "**#{(msg =~ @stage.validation[1]).nil?}" *50
			if (msg =~ @stage.validation[1]).nil?
				puts "***********WRONG!************"*100
				return false
			else
				puts "***********CORRECT!************"*100
				#This will be more complicated!![TODO]
				num = @repo.order.find_index(@repo.status)
				unless num.nil?
					@repo.status = @repo.order[num+1]
					@repo.save
				end
				return true
			end
		end
	end

	def step_index
		num = @repo.order.find_index(@repo.status)
	end

	def get_user
		if @repo.order.size == 8
			1
		else
			2
		end
	end	

	def next_stage
		@stage = Stage.where(step_number: @repo.status,course_id: @repo.course_id).first
	end

end

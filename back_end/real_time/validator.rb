class validator

attr_accessor :r

    def initialize(sid)
        @stage = Stage.where(id: sid).first
    end

    def validate(cmd,output)
        if @stage.validation[0] == "cmd_r"
            if cmd == @stage.validation[1]
                return true
            else
                return false
            end
        else

        end


    end



end

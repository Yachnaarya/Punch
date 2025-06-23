class PunchesController < ApplicationController
	def index
		@punches = current_user.punchs
	end
	def new
		@punch = Punch.new
	end
	def create
		@punch = Punch.new(in_time: Time.now)
		@punch.user =current_user
		if @punch.save
			redirect_to punches_path, notice: "Punch created successfully"
		else
			render :new
		end
	end

	def update
		@punch = Punch.find(params[:id])
		if @punch.update(out_time: Time.current)
			redirect_to punches_path, notice: "Punched out at #{@punch.out_time.in_time_zone('Asia/Kolkata').strftime('%I:%M %p')}"
		else
			redirect_to punches_path, alert: "Failed to punch out"
		end
	end
	

	private

  def punch_params
    params.permit(:in_time, :out_time)
  end
end

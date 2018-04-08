class ContestsController < ApplicationController
	before_action :set_contest, only: [:edit, :update, :destroy, :show]
	before_action :set_settings, only: [:index, :show, :edit, :update, :destroy, :concurso]

	def index
		@contests = Contest.all
	end

	def concurso
		@contests = Contest.all
	end	

	def new
		@contest = Contest.new
	end		

	def edit		
	end	

	def show
	end	

	def create
		@contest = Contest.new(contest_params)
		if @contest.save
		   redirect_to contests_path
		else
		   render 'new'
		end      
	end

	def update		
		if @contest.update(contest_params)
		   redirect_to contests_path
		else
		   render 'edit'
		end   	   
	end

	def destroy
		@contest.destroy
		redirect_to contests_path		
	end

	private

	def set_contest
      @contest = Contest.find(params[:id])
    end

    def set_setting
      @setting = Setting.first
      @render = params[:config]
    end
	
	def contest_params
		params.require(:contest).permit(:titulo, :descripcion, :document)
	end	
end

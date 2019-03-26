class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end
#sets the start date parameter of the job object to the current date
  def new
    @job = Job.new :start_date => Time.now.strftime('%m/%d/%Y')
  end
#controller function that allows the user to create a new job object with parameters
  def create
     params.require(:job).permit!
     @job = Job.new(params[:job])
     if @job.save
       redirect_to job_path(@job)
     end
   end
#controller function that allows the current selected job to be deleted
   def destroy
     @job = Job.find(params[:id])
     @job.destroy
     redirect_to jobs_path
   end
#controller function that selects the object the user clicks to be edited
   def edit
      @job = Job.find(params[:id])
   end
#controler function for the update functionality
   def update
       @job = Job.find(params[:id])
       if @job.update(job_params)
           redirect_to @job
       else
           render 'edit'
       end
   end
end

private
#this code is not displayed to the user, it sets permissions to change values in the object
  def job_params
    params.require(:job).permit!
  end
